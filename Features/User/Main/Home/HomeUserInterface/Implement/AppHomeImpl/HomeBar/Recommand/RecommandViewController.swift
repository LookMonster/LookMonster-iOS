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
}

class RecommandViewController: UIViewController, RecommandPresentable, RecommandViewControllable, RecommandListener  {
    
    private var viewModel: MonsterBannerModel?
    private var cellList: [UITableViewCell] = []
    private var cells: [RecommandBannerCell] = []
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
    }
}

extension RecommandViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return (self.view.frame.height / 2) + 40
        } else if indexPath.row == 1 {
            return self.view.frame.height / 3.55
        } else {
            return self.view.frame.height / 2
        }
    }
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("클릭")
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
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MonsterCategoryTableViewCell.identifier) as? MonsterCategoryTableViewCell else {
                return UITableViewCell()
            }
            cell.setUp(viewModel)
            return cell
        }
    }
}
