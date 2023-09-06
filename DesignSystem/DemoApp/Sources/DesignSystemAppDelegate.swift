import UIKit

@main
final class DesignSystemAppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        
        let root = UINavigationController(rootViewController: DesignSystemViewController())
        window.rootViewController = root
        window.makeKeyAndVisible()
        self.window = window
        return true
    }
}
