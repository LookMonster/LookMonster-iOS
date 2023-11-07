import Foundation
import UIKit
import SnapKit
import RxCocoa
import RxSwift
import DesignSystem
import ResourceKit

public class ButtonViewController: UIViewController {
    private let disposeBag = DisposeBag()
    
    // Auth 🍎
    var appleButton = MonsterAuthButton(image: ResourceKitAsset.appleIcon.image, title: "apple로 시작하기", backgorundColor: .black, titleColor: .white)
    
    // basic 🎱
    var nextButton = MonsterButton(title: "다음", backgorundColor: .black, titleColor: .white)
    
    // double 🎱
    let doubleTextButton = MonsterDoubleTextButton(title1: "비밀번호 찾기", title2: "아이디 찾기", thintColor: .black, backgroundColor: .clear)

    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        attribute()
        layout()
        doubleButtonAction()
    }
    
    func attribute() {
        view.backgroundColor = .white
    }
    
    func doubleButtonAction() {
        doubleTextButton.greetingObservable.subscribe(onNext: {
            print("비밀번호 찾기")
        }).disposed(by: doubleTextButton.disposeBag)

        doubleTextButton.farewellObservable.subscribe(onNext: {
            print("아이디 찾기")
        }).disposed(by: doubleTextButton.disposeBag)
    }
    
    func layout() {
        [appleButton, nextButton, doubleTextButton].forEach { view.addSubview($0) }
        
        appleButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview().inset(24.0)
            $0.height.equalTo(48.0)
        }
        
        nextButton.snp.makeConstraints {
            $0.top.equalTo(appleButton.snp.bottom).offset(30.0)
            $0.leading.trailing.equalToSuperview().inset(24.0)
            $0.height.equalTo(48.0)
        }
        
        doubleTextButton.snp.makeConstraints {
            $0.top.equalTo(nextButton.snp.bottom).offset(30.0)
            $0.leading.equalTo(nextButton.snp.leading)
        }
    }
    
}
