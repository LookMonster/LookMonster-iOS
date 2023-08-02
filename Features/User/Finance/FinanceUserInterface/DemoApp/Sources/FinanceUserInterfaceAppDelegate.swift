import UIKit

@UIApplicationMain
class FinanceAppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = FinanceUserInterfaceViewController()
        window.makeKeyAndVisible()
        self.window = window
        return true
    }
}

