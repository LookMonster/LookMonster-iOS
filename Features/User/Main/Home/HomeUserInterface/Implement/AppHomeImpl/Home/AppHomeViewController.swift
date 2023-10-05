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

protocol AppHomePresentableListener: AnyObject {
}

final class AppHomeViewController: UIViewController,
                                   AppHomePresentable,
                                   AppHomeViewControllable,
                                   PageChangeable {
    
    weak var listener: AppHomePresentableListener?
    var disposeBag = DisposeBag()
    
    internal lazy var pagingTabBar = MonsterPagingTabBar(categoryTitleList:["추천", "랭킹", "발매정보", "남성", "요즘것들", "여성", "발견", "준하픽", "인기"])
    
    internal lazy var viewControllers : [UIViewController] = [
        RecommandViewController()
    ]
    
    public var uiviewController: UIViewController {
        return self
    }
    
    private lazy var containerViews = UIView()
    
    private lazy var navLabel = UILabel().then {
        $0.textColor = UIColor.black
        $0.text = "LOOK MONSTER"
        $0.font = .systemFont(ofSize: 25.0, weight: .bold)
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        self.setupLayout(containerView: containerViews)
        self.bindEvents(containerView: containerViews, disposeBag: disposeBag)
    
        setupViews()
        pagingTabBar.selectedIndex.onNext(0)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupViews()
    }
    
    private func setupViews() {
        let bellImage = ResourceKitAsset.bellIcon.image
        let bellButton = UIBarButtonItem(image: bellImage, style: .plain, target: self, action: nil)
        bellButton.tintColor = .black
        self.navigationItem.rightBarButtonItem = bellButton
        
        tabBarItem = UITabBarItem(title: "Home", image: ResourceKitAsset.homeImage.image, tag: 0)
        view.backgroundColor = .white
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: navLabel)
        self.navigationItem.leftItemsSupplementBackButton = true
        
        self.navigationController?.navigationBar.backgroundColor = .red
    }
    
}
