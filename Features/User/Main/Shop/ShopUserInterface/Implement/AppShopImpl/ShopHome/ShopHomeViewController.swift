import UIKit
import ResourceKit
import ShopUserInterface

class ShopHomeViewController: UIViewController, ShopHomePresentable, ShopHomeViewControllable, ShopHomeListener  {
    
    var listener: ShopHomeListener?
    
    public var uiviewController: UIViewController {
        return self
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        tabBarItem = UITabBarItem(title: "Shop", image: ResourceKitAsset.shopImage.image, tag: 3)
        view.backgroundColor = .yellow
    }
}
