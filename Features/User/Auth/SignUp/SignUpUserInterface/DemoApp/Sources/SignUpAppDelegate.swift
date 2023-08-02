import UIKit

@UIApplicationMain
class SignUpAppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = SignUpUserInterfaceViewController()
        window.makeKeyAndVisible()
        self.window = window
        return true
    }
}

