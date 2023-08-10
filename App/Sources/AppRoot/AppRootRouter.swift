import RIBs
import RIBsUtil
import FinanceUserInterface
import HomeUserInterface
import UserProfileUserInterface
import StyleUserInterface
import CommunityUserInterface

protocol AppRootInteractable: Interactable,
                              AppHomeListener,
                              FinanceHomeListener,
                              UserProfileHomeListener,
                              StyleHomeListener,
                              CommunityHomeListener {
    var router: AppRootRouting? { get set }
    var listener: AppRootListener? { get set }
}

protocol AppRootViewControllable: ViewControllable {
    func setViewControllers(_ viewControllers: [ViewControllable])
}

final class AppRootRouter: LaunchRouter<AppRootInteractable, AppRootViewControllable>, AppRootRouting {
    
    private let appHome: AppHomeBuildable
    private let financeHome: FinanceHomeBuildable
    private let profileHome: UserProfileHomeBuildable
    private let styleHome: StyleHomeBuildable
    private let communityHome: CommunityHomeBuildable
    
    private var appHomeRouting: ViewableRouting?
    private var financeHomeRouting: ViewableRouting?
    private var profileHomeRouting: ViewableRouting?
    private var styleHomeRouting: ViewableRouting?
    private var communityRouting: ViewableRouting?
    
    init(
        interactor: AppRootInteractable,
        viewController: AppRootViewControllable,
        appHome: AppHomeBuildable,
        styleHome: StyleHomeBuildable,
        communityHome: CommunityHomeBuildable,
        financeHome: FinanceHomeBuildable,
        profileHome: UserProfileHomeBuildable
    ) {
        self.appHome = appHome
        self.styleHome = styleHome
        self.communityHome = communityHome
        self.financeHome = financeHome
        self.profileHome = profileHome
        
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func attachTabs() {
        let appHomeRouting = appHome.build(withListener: interactor)
        let financeHomeRouting = financeHome.build(withListener: interactor)
        let profileHomeRouting = profileHome.build(withListener: interactor)
        let styleHomeRouting = styleHome.build(withListener: interactor)
        let communityRouting = communityHome.build(withListener: interactor)
        
        // 붙이기
        attachChild(appHomeRouting)
        attachChild(styleHomeRouting)
        attachChild(communityRouting)
        attachChild(financeHomeRouting)
        attachChild(profileHomeRouting)
        
        //뷰컨 띄우기
        let viewControllers = [
            NavigationControllerable(root: appHomeRouting.viewControllable),
            styleHomeRouting.viewControllable,
            communityRouting.viewControllable,
            NavigationControllerable(root: financeHomeRouting.viewControllable),
            profileHomeRouting.viewControllable,
        ]
        
        viewController.setViewControllers(viewControllers)
    }
}
