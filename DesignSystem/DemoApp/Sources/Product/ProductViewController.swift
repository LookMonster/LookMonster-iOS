import Foundation
import UIKit
import SnapKit
import RxCocoa
import RxSwift
import ResourceKit

enum TestProductCell {
    case product(model: MonsterBannerModel)
}

public class ProductViewController: UIViewController {
    
    private var viewModel: MonsterBannerModel?
    private var cellList: [UITableViewCell] = []
    private var cells: [TestProductCell] = []
    
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
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .systemBackground
        tableView.showsHorizontalScrollIndicator = false
        tableView.register(
            MonsterProductTableViewCell.self,
            forCellReuseIdentifier: MonsterProductTableViewCell.identifier
        )
        return tableView
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = MonsterBannerModel()
        self.configureUI()
        self.addCells()
        
        view.backgroundColor = .white
    }
}

extension ProductViewController {
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
        self.cells.append(.product(model: viewModel))
    }
}

extension ProductViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height / 2
    }
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("클릭")
    }
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        switch self.cells[indexPath.item] {
        case .product:
            cell.separatorInset = UIEdgeInsets(top: 0, left: self.tableView.bounds.width, bottom: 0, right: 0)
        }
    }
}

extension ProductViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cells.count
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = self.viewModel else { return UITableViewCell() }
        switch self.cells[indexPath.item] {
        case .product:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MonsterProductTableViewCell.identifier) as? MonsterProductTableViewCell else {
                return UITableViewCell()
            }
            cell.setUp(viewModel, products: testProductInfos)
            return cell
        }
    }
}
