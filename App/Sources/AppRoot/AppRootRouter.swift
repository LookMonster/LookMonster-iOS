import RIBs
import RIBsUtil
//import FinanceUserInterface
import HomeUserInterface
import UserProfileUserInterface
import StyleUserInterface
import CommunityUserInterface
import ShopUserInterface

protocol AppRootInteractable: Interactable,
                              AppHomeListener,
                              ShopHomeListener,
                              UserProfileHomeListener,
                              StyleHomeListener,
                              CommunityListener {
    var router: AppRootRouting? { get set }
    var listener: AppRootListener? { get set }
}

protocol AppRootViewControllable: ViewControllable {
    func setViewControllers(_ viewControllers: [ViewControllable])
}

final class AppRootRouter: LaunchRouter<AppRootInteractable, AppRootViewControllable>, AppRootRouting {
    
    private let appHome: AppHomeBuildable
    private let profileHome: UserProfileHomeBuildable
    private let styleHome: StyleHomeBuildable
    private let communityHome: CommunityBuildable
    private let shopHome: ShopHomeBuildable
    
    private var appHomeRouting: ViewableRouting?
    private var profileHomeRouting: ViewableRouting?
    private var styleHomeRouting: ViewableRouting?
    private var communityRouting: ViewableRouting?
    private var shopRouting: ViewableRouting?
    
    init(
        interactor: AppRootInteractable,
        viewController: AppRootViewControllable,
        appHome: AppHomeBuildable,
        styleHome: StyleHomeBuildable,
        communityHome: CommunityBuildable,
        shopHome: ShopHomeBuildable,
        profileHome: UserProfileHomeBuildable
    ) {
        self.appHome = appHome
        self.styleHome = styleHome
        self.communityHome = communityHome
        self.shopHome = shopHome
        self.profileHome = profileHome
        
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func attachTabs() {
        let appHomeRouting = appHome.build(withListener: interactor)
//        let financeHomeRouting = financeHome.build(withListener: interactor)
        let profileHomeRouting = profileHome.build(withListener: interactor)
        let styleHomeRouting = styleHome.build(withListener: interactor)
        let communityRouting = communityHome.build(withListener: interactor, cuttentImageIndex: 0)
        let shopRouting = shopHome.build(withListener: interactor)
        
        // 붙이기
        attachChild(appHomeRouting)
        attachChild(styleHomeRouting)
        attachChild(communityRouting)
        attachChild(shopRouting)
        attachChild(profileHomeRouting)
        
        //뷰컨 띄우기
        let viewControllers = [
            NavigationControllerable(root: appHomeRouting.viewControllable),
            styleHomeRouting.viewControllable,
            communityRouting.viewControllable,
            NavigationControllerable(root: shopRouting.viewControllable),
            profileHomeRouting.viewControllable,
        ]
        
        viewController.setViewControllers(viewControllers)
    }
}
