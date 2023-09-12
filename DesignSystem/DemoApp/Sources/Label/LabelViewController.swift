import Foundation
import DesignSystem
import UIKit
import SnapKit
import RxCocoa
import RxSwift
import ResourceKit

public class LabelViewController: UIViewController {
    private let disposeBag = DisposeBag()
    
    let variousLabel1 = MonsterVariousLabel(text: "King_of_the_junha", type: .talk, timerType: .secondsAgo(5))
    
    let variousLabel2 = MonsterVariousLabel(text: "junha", type: .popular, timerType: .daysAgo(5))
    
    let variousLabel3 = MonsterVariousLabel(text: "junhaasdfsfdadfdf", type: .vote, timerType: .yearsAgo(5))
    
    let variousLabel4 = MonsterVariousLabel(text: "박준하", type: .talk, timerType: .weeksAgo(5))
    
    let authLabel = MonsterAuthLabel(text: "MonsterAuthLabel")
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(variousLabel1)
        view.addSubview(variousLabel2)
        view.addSubview(variousLabel3)
        view.addSubview(variousLabel4)
        
        view.addSubview(authLabel)
        
        variousLabel1.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide)
        }
        
        variousLabel2.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(variousLabel1.snp.bottom).offset(15.0)
        }
        
        variousLabel3.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(variousLabel2.snp.bottom).offset(15.0)
        }
        
        variousLabel4.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(variousLabel3.snp.bottom).offset(15.0)
        }
        
        authLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(variousLabel4.snp.bottom).offset(30.0)
        }
    }
}
