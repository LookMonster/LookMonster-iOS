import UIKit
import ShopUserInterface

class AllViewController: UIViewController, AllPresentable, AllViewControllable, AllListener  {
    var listener: AllListener?
    
    public var uiviewController: UIViewController {
        return self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
    }
}
