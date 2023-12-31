import UIKit
import SuperUI
import SnapKit
import Then
import DesignSystem
import ShopUserInterface

enum Item {
    case subCategory
    case filter
    case product
}

class AllViewController: BaseViewController, AllPresentable, AllViewControllable, AllListener, UITableViewDelegate, UITableViewDataSource {
    
    var listener: AllListener?
    
    private let category: MonsterCategory
    
    private var items: [Item] = [
        .subCategory,
        .filter,
        .product
    ]
    
    init(category: MonsterCategory) {
        self.category = category
        super.init()
    }
    
    private lazy var tableView = UITableView().then {
        $0.separatorInset.left = 0
        $0.allowsSelection = false
        $0.register(MonsterTrendingKeywordTableViewCell.self, forCellReuseIdentifier: MonsterTrendingKeywordTableViewCell.id)
        $0.register(MonsterFilterTableViewCell.self, forCellReuseIdentifier: MonsterFilterTableViewCell.id)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch items[indexPath.item] {
        case .subCategory:
            if let cell = tableView.dequeueReusableCell(withIdentifier: MonsterTrendingKeywordTableViewCell.id) as? MonsterTrendingKeywordTableViewCell {
                cell.setUp()
                return cell
            } else {
                return UITableViewCell()
            }
        case .filter:
//            if let cell = tableView.dequeueReusableCell(withIdentifier: MonsterFilterTableViewCell.id) as? MonsterFilterTableViewCell {
//                cell.setUp()
//                cell.selectFilterCellClosure = { [weak self] index in
//                    let filterPopupViewController = FilterPopupViewController(index: index)
//                    self?.present(filterPopupViewController, animated: true)
//                }
//                return cell
//            } else {
                return UITableViewCell()
//            }
        case .product:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch items[indexPath.item] {
        case .subCategory:
            return MonsterTrendingKeywordTableViewCell.cellHeight
        case .filter:
            return MonsterFilterTableViewCell.cellHeight
        case .product:
            return 0
        }
    }
}
