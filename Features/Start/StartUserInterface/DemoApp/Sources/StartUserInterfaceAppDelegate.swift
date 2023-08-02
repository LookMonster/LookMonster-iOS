import UIKit

@UIApplicationMain
class StartAppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = StartUserInterfaceViewController()
        window.makeKeyAndVisible()
        self.window = window
        return true
    }
}

