import UIKit

@UIApplicationMain
class TransportAppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = TransportUserInterfaceViewController()
        window.makeKeyAndVisible()
        self.window = window
        return true
    }
}

