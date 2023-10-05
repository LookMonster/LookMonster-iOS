import UIKit
import RIBs
import SnapKit
import Then
import RxCocoa
import SuperUI
import RxSwift
import Kingfisher
import SuperUI
import DesignSystem
import ResourceKit
import CommunityUserInterface

class CommunityViewController: BaseViewController,
                               CommunityPresentable,
                               CommunityViewControllable,
                               PageChangeable {
    
    internal var listener: CommunityListener?
    
    internal lazy var pagingTabBar = MonsterPagingTabBar(categoryTitleList:["인기", "토크", "투표", "질문"])
    internal lazy var viewControllers : [UIViewController] = [
        PopularViewController(),
        TalkViewController(),
        VoteViewController(),
        QuestionViewController()
    ]
    
    public var uiviewController: UIViewController {
        return self
    }
    
    private lazy var containerViews = UIView()
    
    private lazy var searchButton: UIBarButtonItem = {
        let searchImage = ResourceKitAsset.searchIcon.image
        return UIBarButtonItem(image: searchImage, style: .plain, target: nil, action: nil).then {
            $0.tintColor = .black
        }
    }()

    private lazy var penButton: UIBarButtonItem = {
        let penImage = ResourceKitAsset.writingIcon.image
        return UIBarButtonItem(image: penImage, style: .plain, target: nil, action: nil).then {
            $0.tintColor = .black
        }
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout(containerView: containerViews)
        bindEvents(containerView: containerViews, disposeBag: disposeBag)

        view.backgroundColor = .white

        pagingTabBar.selectedIndex.onNext(0)
    }
    
    public override init() {
        super.init()
        attribute()
        bindActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        debugPrint("\(self) deinit")
    }
    
    override func configureNavigationBar() {
        title = "커뮤니티"
        
        navigationItem.leftBarButtonItem = searchButton
        navigationItem.rightBarButtonItem = penButton
        tabBarItem = UITabBarItem(title: "Community", image: ResourceKitAsset.communityImage.image, tag: 2)
    }
    
    override func attribute() {
        view.backgroundColor = .systemBackground
    }
    
    override func bindActions() {
        searchButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.listener?.searchButtonTap()
            })
            .disposed(by: disposeBag)
        
        penButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.listener?.penButtonTap()
            })
            .disposed(by: disposeBag)
    }
}
