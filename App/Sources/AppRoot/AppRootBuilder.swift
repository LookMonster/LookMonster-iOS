import RIBs
import UIKit
import FinanceData
import FinanceUserInterface
import HomeUserInterface

import FinanceUserInterfaceImpl
import HomeUserInterfaceImpl

import UserProfileUserInterface
import UserProfileUserInterfaceImpl


protocol AppRootDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

// MARK: - Builder

protocol AppRootBuildable: Buildable {
    func build() -> (launchRouter: LaunchRouting, urlHandler: URLHandler)
}

final class AppRootBuilder: Builder<AppRootDependency>, AppRootBuildable {
    
    override init(dependency: AppRootDependency) {
        super.init(dependency: dependency)
    }
    
    func build() -> (launchRouter: LaunchRouting, urlHandler: URLHandler) {
        let tabBar = RootTabBarController()
        
        let component = AppRootComponent(
            dependency: dependency,
            rootViewcontroller: tabBar
        )
        
        let interactor = AppRootInteractor(presenter: tabBar)
        
        // 세가지 자식 riblet을 붙이기 위해서 생성
        let appHome = AppHomeBuilder(dependency: component)
        let financeHome = FinanceHomeBuilder(dependency: component)
        let profileHome = UserProfileHomeBuilder(dependency: component)
        let router = AppRootRouter(
            interactor: interactor,
            viewController: tabBar,
            appHome: appHome,
            financeHome: financeHome,
            profileHome: profileHome
        )
        
        return (router, interactor)
    }
}
