import Foundation
import DesignSystem
import UIKit
import SnapKit
import RxCocoa
import RxSwift
import ResourceKit
import HomeUserInterface

enum RecommandBannerCell {
    case banner(model: MonsterBannerModel)
    case category(model: MonsterBannerModel)
    case popularProduct(model: MonsterBannerModel)
    case storyStyle(model: MonsterBannerModel)
}

class RecommandViewController: UIViewController, RecommandPresentable, RecommandViewControllable, RecommandListener  {
    
    private var viewModel: MonsterBannerModel?
    private var cellList: [UITableViewCell] = []
    private var cells: [RecommandBannerCell] = []

    private var isBannerVisible = true
    
    let testProductInfos: [MonsterProductInfo] = [
        MonsterProductInfo(
            image: ResourceKitAsset.testProduct1.image,
            name: "Jordan",
            description: "Jordan 1 Retro Low OG Black Toe",
            price: "175,000원"
        ),
        MonsterProductInfo(
            image: ResourceKitAsset.testProduct2.image,
            name: "Keen",
            description: "Keen Jasper Sneakers Brindle Cream",
            price: "143,100원"
        ),
        MonsterProductInfo(
            image: ResourceKitAsset.testProduct3.image,
            name: "Converse",
            description: "Converse x Play Comme des Gracons Chuck 70 Hi Black",
            price: "115,000원"
        ),
        MonsterProductInfo(
            image: ResourceKitAsset.testProduct4.image,
            name: "Jordan",
            description: "Jordan 1 x Travis Scott Retro Low OG SP Sail and Ridgerock",
            price: "1,374,000원"
        ),
        MonsterProductInfo(
            image: ResourceKitAsset.testProduct5.image,
            name: "Nike",
            description: "Nike Air Force 1 '07 WB Flax",
            price: "153,000원"
        )
    ]
    
    let testStoryStyleInfos: [MonsterStoryStyleInfo] = [
        MonsterStoryStyleInfo(styleImage: ResourceKitAsset.styleTest1.image, userImage: ResourceKitAsset.frame2.image, userName: "@asdfasdf1"),
        MonsterStoryStyleInfo(styleImage: ResourceKitAsset.styleTest1.image, userImage: ResourceKitAsset.frame2.image, userName: "@asdfasdf2"),
        MonsterStoryStyleInfo(styleImage: ResourceKitAsset.styleTest1.image, userImage: ResourceKitAsset.frame2.image, userName: "@asdfasdf3"),
        MonsterStoryStyleInfo(styleImage: ResourceKitAsset.styleTest1.image, userImage: ResourceKitAsset.frame2.image, userName: "@asdfasdf4"),
        MonsterStoryStyleInfo(styleImage: ResourceKitAsset.styleTest1.image, userImage: ResourceKitAsset.frame2.image, userName: "@asdfasdf5"),
    ]
    
    var listener: RecommandListener?

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .systemBackground
        tableView.showsHorizontalScrollIndicator = false
        tableView.register(
            MonsterBannerTableViewCell.self,
            forCellReuseIdentifier: MonsterBannerTableViewCell.identifier
        )
        tableView.register(
            MonsterCategoryTableViewCell.self,
            forCellReuseIdentifier: MonsterCategoryTableViewCell.identifier
        )
        tableView.register(
            MonsterProductTableViewCell.self,
            forCellReuseIdentifier: MonsterProductTableViewCell.identifier
        )
        tableView.register(
            MonsterStoryStyleTableViewCell.self,
            forCellReuseIdentifier: MonsterStoryStyleTableViewCell.identifier)
        
        return tableView
    }()
        
    public var uiviewController: UIViewController {
        return self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel = MonsterBannerModel()
        self.configureUI()
        self.addCells()
        
        view.backgroundColor = .white
    }
    
    func communityBackground() {
        print("saf")
    }
}

extension RecommandViewController {
    private func configureUI() {
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    private func addCells() {
        guard let viewModel = self.viewModel else { return }
        self.cells.append(.banner(model: viewModel))
        self.cells.append(.category(model: viewModel))
        self.cells.append(.popularProduct(model: viewModel))
        self.cells.append(.storyStyle(model: viewModel))
    }
}

extension RecommandViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return (self.view.frame.height / 2) + 40
        } else if indexPath.row == 1 {
            return self.view.frame.height / 3.55
        } else if indexPath.row == 3 {
            return self.view.frame.height / 2.6
        } else {
            return self.view.frame.height / 2
        }
    }

    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        switch self.cells[indexPath.item] {
        case .banner:
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        default:
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }
}

extension RecommandViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cells.count
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = self.viewModel else { return UITableViewCell() }
        switch self.cells[indexPath.item] {
        case .banner:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: MonsterBannerTableViewCell.identifier
            ) as? MonsterBannerTableViewCell else {
                return UITableViewCell()
            }
            cell.setUp(viewModel)
            return cell
            
        case .category:
            guard let cell = 
                    tableView.dequeueReusableCell(withIdentifier: MonsterCategoryTableViewCell.identifier) as? MonsterCategoryTableViewCell else {
                return UITableViewCell()
            }
            cell.setUp(viewModel)
            return cell
        case .popularProduct:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MonsterProductTableViewCell.identifier) as? MonsterProductTableViewCell else {
                return UITableViewCell()
            }
            cell.setUp(viewModel, products: testProductInfos)
            cell.headerLabels(mainLabelText: "인기 상품", subLabelText: "사람들이 많이 찾는 상품")
            return cell
        case .storyStyle:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MonsterStoryStyleTableViewCell.identifier) as? MonsterStoryStyleTableViewCell else {
                return UITableViewCell()
            }
            cell.setUp(viewModel, storyStyleInfo: testStoryStyleInfos)
            return cell
        }
    }
}
