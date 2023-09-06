import RIBs
import UIKit
import Swinject
import FinanceData
import FinanceUserInterface
import HomeUserInterface

import FinanceUserInterfaceImpl
import HomeUserInterfaceImpl

import UserProfileUserInterface
import UserProfileUserInterfaceImpl

import StyleUserInterface
import StyleUserInterfaceImpl

import CommunityUserInterface
import CommunityUserInterfaceImpl

import ShopUserInterface
import ShopUserInterfaceImpl

protocol AppRootDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // 이걸로 RIB 생성
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
        let styleHome = StyleHomeBuilder(dependency: component)
//        let financeHome = FinanceHomeBuilder(dependency: component)
        let shopHome = ShopHomeBuilder(dependency: component)
        let profileHome = UserProfileHomeBuilder(dependency: component)
        let communityHome = CommunityBuilder(dependency: component)
        let router = AppRootRouter(
            interactor: interactor,
            viewController: tabBar,
            appHome: appHome,
            styleHome: styleHome,
            communityHome: communityHome,
            shopHome: shopHome,
            profileHome: profileHome
        )
        
        return (router, interactor)
    }
}
