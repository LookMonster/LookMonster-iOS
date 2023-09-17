import UIKit
import RIBs
import DesignSystem
import HomeUserInterface
import HomeUserInterfaceImpl
import HomeData
import HomeDataImpl
import HomeDomain
import HomeDomainImpl
import TokenManager
import TokenManagerImpl
import LKNetwork
import LKNetworkImpl

import RxSwift
import RxCocoa


@UIApplicationMain
class HomeAppDelegate: UIResponder, UIApplicationDelegate {
    
    private final class MockAppHomeListener: AppHomeListener {
        func homeBackground() {
            fatalError()
        }
    }
    
    var window: UIWindow?
    var router: ViewableRouting?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let window = UIWindow(frame: UIScreen.main.bounds)
        
        let homeComponent = AppHomeMockComponent()
//        router = AppHomeBuilder(dependency: homeComponent)
//            .build(withListener: MockAppHomeListener(), cuttentImageIndex: nil as Int?)
        router = AppHomeBuilder(dependency: homeComponent)
            .build(withListener: MockAppHomeListener())
        router?.interactable.activate()
        
        let navigationController = UINavigationController(rootViewController: self.router!.viewControllable.uiviewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        self.window = window
        
        return true
        
    }
}

