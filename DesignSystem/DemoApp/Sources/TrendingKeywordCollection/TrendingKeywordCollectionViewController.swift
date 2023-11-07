import UIKit
import DesignSystem
import SuperUI

enum Item {
    case subCategory
    case filter
    case product
}

class TrendingKeywordCollectionViewController: UITableViewController {

    private let category: MonsterCategory
    
    private var items: [Item] = [
        .subCategory,
        .filter,
        .product
    ]
    
    init(category: MonsterCategory) {
        self.category = category
        super.init(style: .plain)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        tableView.separatorInset.left = 0
        tableView.allowsSelection = false
        tableView.register(MonsterTrendingKeywordTableViewCell.self, forCellReuseIdentifier: MonsterTrendingKeywordTableViewCell.id)
    }
        
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch items[indexPath.item] {
        case .subCategory:
            return MonsterTrendingKeywordTableViewCell.cellHeight
        case .filter:
            return MonsterTrendingKeywordTableViewCell.cellHeight
        case .product:
            return MonsterTrendingKeywordTableViewCell.cellHeight
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch items[indexPath.item] {
        case .subCategory:
            if let cell = tableView.dequeueReusableCell(withIdentifier: MonsterTrendingKeywordTableViewCell.id) as? MonsterTrendingKeywordTableViewCell {
                cell.setUp()
                return cell
            } else {
                return UITableViewCell()
            }
        case .filter:
            return UITableViewCell()
        case .product:
                return UITableViewCell()
        }
    }
}
