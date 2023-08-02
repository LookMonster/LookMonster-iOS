import UIKit
import SnapKit

@UIApplicationMain
class LoginAppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = LoginUserInterfaceViewController()
        window.makeKeyAndVisible()
        self.window = window
        return true
    }
}

