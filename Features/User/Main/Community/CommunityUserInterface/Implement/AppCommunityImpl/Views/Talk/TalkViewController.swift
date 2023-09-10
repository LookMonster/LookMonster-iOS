import UIKit
import CommunityUserInterface

class TalkViewController: UIViewController, TalkPresentable, TalkViewControllable, TalkListener  {
    func communityBackground() {
        print("asdf")
    }
    
    var listener: TalkListener?
    
    public var uiviewController: UIViewController {
        return self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
    }
}
