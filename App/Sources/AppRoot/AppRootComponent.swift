import Foundation

import RIBs

import HomeUserInterface
import HomeUserInterfaceImpl

import UserProfileUserInterface
import UserProfileUserInterfaceImpl

import StyleUserInterface
import StyleUserInterfaceImpl

import LKNetwork
import LKNetworkImpl

import CommunityUserInterface
import CommunityUserInterfaceImpl

import ShopUserInterface
import ShopUserInterfaceImpl

final class AppRootComponent: Component<AppRootDependency>, AppHomeDependency, UserProfileHomeDependency, StyleHomeDependency, CommunityDependency, ShopHomeDependency  {

//    var topupBaseViewController: ViewControllable { rootViewcontroller.topViewControllable }
    
    private let rootViewcontroller: ViewControllable
    
    init(
        dependency: AppRootDependency,
        rootViewcontroller: ViewControllable
    ) {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [SuperAppURLProtocol.self]
        
//        setupURLProtocol()
        
        let network = NetworkImp(session: URLSession(configuration: config))
        
        self.rootViewcontroller = rootViewcontroller
        super.init(dependency: dependency)
    }
}
