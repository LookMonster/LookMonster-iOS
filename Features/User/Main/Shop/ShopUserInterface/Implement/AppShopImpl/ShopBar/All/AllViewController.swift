import UIKit
import SuperUI
import ShopUserInterface
import DesignSystem

enum Item {
    case subCategory
    case filter
    case product
}

class AllViewController: BaseViewController, AllPresentable, AllViewControllable, AllListener, UITableViewDelegate, UITableViewDataSource  {
    
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
    
    private lazy var tableView = UITableView()

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public var uiviewController: UIViewController {
        return self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        tableView.separatorInset.left = 0
        tableView.allowsSelection = false
        tableView.register(MonsterTrendingKeywordTableViewCell.self, forCellReuseIdentifier: MonsterTrendingKeywordTableViewCell.id)
        tableView.delegate = self
        tableView.dataSource = self
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
            print("")
            return UITableViewCell()
        case .product:
            print("")
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch items[indexPath.item] {
        case .subCategory:
            return MonsterTrendingKeywordTableViewCell.cellHeight
        case .filter:
            return 0
        case .product:
            return 0
        }
    }
}
