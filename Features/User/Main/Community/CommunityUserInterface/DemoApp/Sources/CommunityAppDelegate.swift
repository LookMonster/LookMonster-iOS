import UIKit
import RIBs
import DesignSystem
import CommunityUserInterface
import CommunityUserInterfaceImpl
import CommunityData
import CommunityDataImpl
import CommunityDomain
import CommunityDomainImpl
import TokenManager
import TokenManagerImpl
import LKNetwork
import LKNetworkImpl

import RxSwift
import RxCocoa

@UIApplicationMain
class CommunityAppDelegate: UIResponder, UIApplicationDelegate {

    private final class MockCommunityListener: CommunityListener {
        func searchButtonTap() {
            fatalError()
        }
        
        func penButtonTap() {
            fatalError()
        }
    }
    
    var window: UIWindow?
    var router: ViewableRouting?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        
        let communityComponent = CommunityMockComponent()
        router = CommunityBuilder(dependency: communityComponent)
            .build(withListener: MockCommunityListener(), cuttentImageIndex: nil)
        router?.interactable.activate()
        
        let navigationController = UINavigationController(rootViewController: self.router!.viewControllable.uiviewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }
}

