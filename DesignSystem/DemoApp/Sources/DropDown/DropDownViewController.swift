import UIKit
import SnapKit
import DesignSystem

open class DropDownViewController: UIViewController {
    
    let dropdownView = MonsterDropdownView()
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        view.backgroundColor = .white
    }
    
    func setupUI() {
        view.addSubview(dropdownView)
        
        dropdownView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview().inset(20.0)
            make.height.equalTo(300)
        }
    }
}
