import UIKit
import SuperUI
import ShopUserInterface
import DesignSystem

enum Item {
    case subCategory
    case filter
    case product
}

class AllViewController: UITableViewController, AllPresentable, AllViewControllable, AllListener  {
    var listener: AllListener?
    
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
    
    public var uiviewController: UITableViewController {
        return self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        tableView.separatorInset.left = 0
        tableView.allowsSelection = false
        tableView.register(MonsterTrendingKeywordCollectionView.self, forCellReuseIdentifier: MonsterTrendingKeywordCollectionView.id)
    }
}
