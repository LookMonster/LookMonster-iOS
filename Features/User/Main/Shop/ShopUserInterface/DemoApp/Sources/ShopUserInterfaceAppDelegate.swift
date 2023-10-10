import UIKit
import RIBs
import DesignSystem
import ShopUserInterface
import ShopUserInterfaceImpl
import ShopData
import ShopDataImpl
import ShopDomain
import ShopDomainImpl
import TokenManager
import TokenManagerImpl
import LKNetwork
import LKNetworkImpl

import RxSwift
import RxCocoa

@UIApplicationMain
class ShopUserInterfaceAppDelegate: UIResponder, UIApplicationDelegate {
//    var window: UIWindow?
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        let window = UIWindow(frame: UIScreen.main.bounds)
//        window.rootViewController = ShopHomeViewController()
//        window.makeKeyAndVisible()
//        self.window = window
//        return true
//    }
    
    private final class MockAppShopListener: ShopHomeListener {
        func communityBackground() {
            fatalError()
        }
    }
    
    var window: UIWindow?
    var router: ViewableRouting?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        let shopComponent = ShopMockComponent()
        
        router = ShopHomeBuilder(dependency: shopComponent)
            .build(withListener: MockAppShopListener())
        router?.interactable.activate()
        
        let navigationController = UINavigationController(rootViewController: self.router!.viewControllable.uiviewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }
}

