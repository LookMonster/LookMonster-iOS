import UIKit
import SnapKit
import DesignSystem

open class DropDownViewController: UIViewController {
    
    let dropdownView = MonsterDropdownView()
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        attribute()
        layout()
    }
    
    func attribute() {
        view.backgroundColor = .white
    }
    
    func layout() {
        view.addSubview(dropdownView)
        
        dropdownView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalToSuperview().inset(20.0)
            $0.height.equalTo(300)
        }
    }
}
