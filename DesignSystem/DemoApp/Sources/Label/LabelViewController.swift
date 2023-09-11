import Foundation
import UIKit
import SnapKit
import RxCocoa
import RxSwift
import ResourceKit

public class LabelViewController: UIViewController {
    private let disposeBag = DisposeBag()
    
    let variousLabel1 = MonsterVariousLabel(text: "King_of_the_junha", type: .talk, timerType: .secondsAgo(5))
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(variousLabel1)
        
        variousLabel1.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
