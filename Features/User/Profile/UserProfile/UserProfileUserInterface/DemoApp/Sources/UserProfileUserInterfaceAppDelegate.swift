import UIKit

@UIApplicationMain
class UserProfileAppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = UserProfileUserInterfaceViewController()
        window.makeKeyAndVisible()
        self.window = window
        return true
    }
}

