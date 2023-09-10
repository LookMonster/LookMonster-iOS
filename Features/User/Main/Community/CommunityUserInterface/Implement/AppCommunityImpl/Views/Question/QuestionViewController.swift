import UIKit
import CommunityUserInterface

class QuestionViewController: UIViewController, QuestionPresentable, QuestionViewControllable, QuestionListener  {
    func communityBackground() {
        print("SAdf")
    }
    
    var listener: QuestionListener?
    
    public var uiviewController: UIViewController {
        return self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
    }
}
