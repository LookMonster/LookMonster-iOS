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

class CommunityViewController: UIViewController, CommunityPresentable, CommunityViewControllable, PageChangeable {
    
    var listener: CommunityListener?
    var disposeBag = DisposeBag()
    
    internal lazy var pagingTabBar = MonsterPagingTabBar(categoryTitleList:["인기", "토크", "투표", "질문"])
    internal lazy var viewControllers : [UIViewController] = [
        PopularViewController(),
        TalkViewController(),
        WhiteViewController(),
        BlackViewController()
    ]
    
    public var uiviewController: UIViewController {
        return self
    }
    
    private lazy var containerViews: UIView = {
         let view = UIView()
         return view
      }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupLayout(containerView: containerViews)
        self.bindEvents(containerView: containerViews, disposeBag: disposeBag)

        view.backgroundColor = .white

        pagingTabBar.selectedIndex.onNext(0)
    }
    
    public init() {
        super.init(nibName: nil, bundle: nil)
        
        self.bk()
        self.navigationSetting()
        self.setupViews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
        self.setupViews()
    }
    
    deinit {
        debugPrint("\(self) deinit")
    }
    
    func navigationSetting() {
        title = "커뮤니티"
        let searchImage = ResourceKitAsset.searchIcon.image
        let searchButton = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector(searchButtonTap))
        searchButton.tintColor = .black
        self.navigationItem.leftBarButtonItem = searchButton
        
        let penImage = ResourceKitAsset.writingIcon.image
        let penButton = UIBarButtonItem(image: penImage, style: .plain, target: self, action: #selector(penButtonTap))
        penButton.tintColor = .black
        self.navigationItem.rightBarButtonItem = penButton

    }
    
    func bk() {
        view.backgroundColor = .systemBackground
    }
    
    func layout() {

    }
    
    @objc func searchButtonTap() {
        print("fdsa")
    }
    
    @objc func penButtonTap() {
        print("asdf")
    }
    
    func setupViews() {
        tabBarItem = UITabBarItem(title: "Community", image: ResourceKitAsset.communityImage.image, tag: 2)
    }
}
