import UIKit
import RIBs

protocol AppRootPresentableListener: AnyObject {
  
}

final class RootTabBarController: UITabBarController, AppRootViewControllable, AppRootPresentable {
  weak var listener: AppRootPresentableListener?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tabBar.isTranslucent = false
    tabBar.tintColor = .black
    tabBar.backgroundColor = .white
  }
  
  // 뷰컨들 붙이기
  func setViewControllers(_ viewControllers: [ViewControllable]) {
    super.setViewControllers(viewControllers.map(\.uiviewController), animated: false)
  }
}
