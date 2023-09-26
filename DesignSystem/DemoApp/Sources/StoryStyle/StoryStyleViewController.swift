import Foundation
import UIKit
import SnapKit
import RxCocoa
import RxSwift
import ResourceKit

enum StoryStyleCell {
    case storyStyle(model: MonsterBannerModel)
}

public class StoryStyleViewController: UIViewController {
    
    private var viewModel: MonsterBannerModel?
    private var cellList: [UITableViewCell] = []
    private var cells: [StoryStyleCell] = []
    
    let testStoryStyleInfos: [MonsterStoryStyleInfo] = [
        MonsterStoryStyleInfo(styleImage: ResourceKitAsset.styleTest1.image, userImage: ResourceKitAsset.frame2.image, userName: "@asdfasdf1"),
        MonsterStoryStyleInfo(styleImage: ResourceKitAsset.styleTest1.image, userImage: ResourceKitAsset.frame2.image, userName: "@asdfasdf2"),
        MonsterStoryStyleInfo(styleImage: ResourceKitAsset.styleTest1.image, userImage: ResourceKitAsset.frame2.image, userName: "@asdfasdf3"),
        MonsterStoryStyleInfo(styleImage: ResourceKitAsset.styleTest1.image, userImage: ResourceKitAsset.frame2.image, userName: "@asdfasdf4"),
        MonsterStoryStyleInfo(styleImage: ResourceKitAsset.styleTest1.image, userImage: ResourceKitAsset.frame2.image, userName: "@asdfasdf5"),
    ]
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .systemBackground
        tableView.showsHorizontalScrollIndicator = false
        tableView.register(
            MonsterStoryStyleTableViewCell.self,
            forCellReuseIdentifier: MonsterStoryStyleTableViewCell.identifier
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

extension StoryStyleViewController {
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
        self.cells.append(.storyStyle(model: viewModel))
    }
}

extension StoryStyleViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height / 2.6
    }

    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        switch self.cells[indexPath.item] {
        case .storyStyle:
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }
}

extension StoryStyleViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cells.count
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = self.viewModel else { return UITableViewCell() }
        switch self.cells[indexPath.item] {
        case .storyStyle:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MonsterStoryStyleTableViewCell.identifier) as? MonsterStoryStyleTableViewCell else {
                return UITableViewCell()
            }
            cell.setUp(viewModel, storyStyleInfo: testStoryStyleInfos)
            return cell
        }
    }
}
