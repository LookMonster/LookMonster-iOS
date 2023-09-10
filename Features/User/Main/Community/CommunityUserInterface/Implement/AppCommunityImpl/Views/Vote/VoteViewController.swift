import UIKit
import CommunityUserInterface

class VoteViewController: UIViewController, VotePresentable, VoteViewControllable, VoteListener  {
    func communityBackground() {
        print("asdf")
    }
    
    var listener: VoteListener?
    
    public var uiviewController: UIViewController {
        return self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
    }
}
