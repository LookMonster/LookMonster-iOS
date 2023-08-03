import UIKit
import ResourceKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let viewController = StartUserInterfaceViewController()
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        callBackgroundImage(true)
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        callBackgroundImage(false)
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        callBackgroundImage(false)
    }

    func callBackgroundImage(_ isBackground: Bool) {
        let TAG_BG_IMG = -101
        let backgroundView = window?.viewWithTag(TAG_BG_IMG)

        if isBackground {
            if backgroundView == nil {
                let bgView = UIView()
                bgView.frame = UIScreen.main.bounds
                bgView.tag = TAG_BG_IMG
                bgView.backgroundColor = .secondarySystemBackground

                let appIcon = UIImageView()
                appIcon.frame = CGRect(x: bgView.layer.bounds.midX - 90, y: bgView.layer.bounds.midY - 90, width: 180, height: 180)
                appIcon.image = ResourceKitAsset.wLogo.image
                bgView.addSubview(appIcon)

                window?.addSubview(bgView)
            }
        } else {
            if let backgroundView = backgroundView {
                backgroundView.removeFromSuperview()
            }
        }
    }
}
