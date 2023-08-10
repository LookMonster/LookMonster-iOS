import RIBs
import UIKit
import ResourceKit

protocol AppHomePresentableListener: AnyObject {
}

final class AppHomeViewController: UIViewController, AppHomePresentable, AppHomeViewControllable {
  
  weak var listener: AppHomePresentableListener?
  
  init() {
    super.init(nibName: nil, bundle: nil)
    
    setupViews()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    
    setupViews()
  }
  
  func updateWidget(_ viewModels: [HomeWidgetViewModel]) {
  }
  
  private func setupViews() {
    title = "홈"
      tabBarItem = UITabBarItem(title: "Home", image: ResourceKitAsset.homeImage.image, tag: 0)
    view.backgroundColor = .backgroundColor
  }
  
}
