import UIKit
import RIBs
import SnapKit
import Then
import RxSwift
import RxCocoa
import SuperUI
import DesignSystem
import ResourceKit
import ShopUserInterface

final class ShopHomeViewController: BaseViewController,
                              ShopHomePresentable,
                              ShopHomeViewControllable,
                              ShopHomeListener,
                              PageChangeable  {
        
    var listener: ShopHomeListener?
    
    internal lazy var pagingTabBar = MonsterPagingTabBar(categoryTitleList:["전체", "럭셔리", "신발", "아우터", "상의", "하의", "가발", "지갑"])
    
    private lazy var searchButton: UIBarButtonItem = {
        let searchImage = ResourceKitAsset.searchIcon.image
        return UIBarButtonItem(image: searchImage, style: .plain, target: nil, action: nil).then {
            $0.tintColor = .black
        }
    }()

    private lazy var hamburgerButton: UIBarButtonItem = {
        let penImage = ResourceKitAsset.writingIcon.image
        return UIBarButtonItem(image: penImage, style: .plain, target: nil, action: nil).then {
            $0.tintColor = .black
        }
    }()
    
    private lazy var containerViews = UIView()
        
    internal lazy var viewControllers: [UIViewController] = [
        AllViewController(category: MonsterCategory(categoryId: 10, name: "asdf"))
    ]
    
    public var uiviewController: UIViewController {
        return self
    }
    
    override init() {
        super.init()
        
        self.setupLayout(containerView: containerViews)
        self.bindEvents(containerView: containerViews, disposeBag: disposeBag)
        
        setupViews()
        
        pagingTabBar.selectedIndex.onNext(0)
    }
    
    required init?(coder: NSCoder) {
        super.init()
        
        setupViews()
    }
    
    func setupViews() {
        tabBarItem = UITabBarItem(title: "Shop", image: ResourceKitAsset.shopImage.image, tag: 3)
        view.backgroundColor = .white
    }
    
    override func configureNavigationBar() {
        navigationItem.leftBarButtonItem = searchButton
        navigationItem.rightBarButtonItem = hamburgerButton
    }
}
