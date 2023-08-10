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
        financeHome: FinanceHomeBuildable,
        profileHome: UserProfileHomeBuildable,
        styleHome: StyleHomeBuildable,
        communityHome: CommunityHomeBuildable
    ) {
        self.appHome = appHome
        self.financeHome = financeHome
        self.profileHome = profileHome
        self.styleHome = styleHome
        self.communityHome = communityHome
        
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
        attachChild(financeHomeRouting)
        attachChild(profileHomeRouting)
        attachChild(styleHomeRouting)
        attachChild(communityRouting)
        
        //뷰컨 띄우기
        let viewControllers = [
            NavigationControllerable(root: appHomeRouting.viewControllable),
            NavigationControllerable(root: financeHomeRouting.viewControllable),
            profileHomeRouting.viewControllable,
            styleHomeRouting.viewControllable,
            communityRouting.viewControllable
        ]
        
        viewController.setViewControllers(viewControllers)
    }
}
