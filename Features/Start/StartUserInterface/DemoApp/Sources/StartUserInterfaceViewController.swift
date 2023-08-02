import UIKit
import ResourceKit
import Then

class StartUserInterfaceViewController: UIViewController {
    
    var c = CustomButton(title: "asdf", backgroundColor: .black, titleColor: .black).then {
        $0.backgroundColor = .red
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemPink
    }
}

