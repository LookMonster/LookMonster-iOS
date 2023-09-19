import UIKit
import HomeUserInterface

class RecommandViewController: UIViewController, RecommandPresentable, RecommandViewControllable, RecommandListener  {
    func communityBackground() {
        print("saf")
    }
    
    var listener: RecommandListener?
    
    public var uiviewController: UIViewController {
        return self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
    }
}
