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

final class ShopHomeViewController: UIViewController,
                              ShopHomePresentable,
                              ShopHomeViewControllable,
                              ShopHomeListener,
                              PageChangeable  {
        
    var listener: ShopHomeListener?
    var disposeBag = DisposeBag()
    
    internal lazy var pagingTabBar = MonsterPagingTabBar(categoryTitleList:["전체", "럭셔리", "신발", "아우터", "상의", "하의", "가발", "지갑"])
    
    private lazy var containerViews = UIView()
    
    internal lazy var viewControllers: [UIViewController] = [
        UIViewController()
    ]
    
    public var uiviewController: UIViewController {
        return self
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
    
    func setupViews() {
        tabBarItem = UITabBarItem(title: "Shop", image: ResourceKitAsset.shopImage.image, tag: 3)
        view.backgroundColor = .yellow
    }
}
