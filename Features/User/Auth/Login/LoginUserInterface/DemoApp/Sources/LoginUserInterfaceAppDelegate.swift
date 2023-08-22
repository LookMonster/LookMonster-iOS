import UIKit
import RIBs
import LoginUserInterface
import LoginUserInterfaceImpl
import LoginData
import LoginDataImpl
import LoginDomain
import LoginDomainImpl
import TokenManager
import TokenManagerImpl
import LKNetwork
import LKNetworkImpl

import RxSwift
import RxCocoa

@UIApplicationMain
class LoginAppDelegate: UIResponder, UIApplicationDelegate {
    
    private final class MockLoginListener: LoginListener {
        func loginButtonDidTap() {
            print("loginButtonDidTap")
        }
        
        func loginCancel() {
            print("LoginCancel")
        }
    }
    
    var window: UIWindow?
    var router: ViewableRouting?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        
        let loginComponent = LoginMockComponent()
        
        router = LoginBuilder(dependency: loginComponent)
            .build(withListener: MockLoginListener(), currentImageIndex: nil)
        router?.interactable.activate()
        router?.load()
        
        window.rootViewController = self.router?.viewControllable.uiviewController
        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }
}
