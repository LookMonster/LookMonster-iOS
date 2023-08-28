//
//  TextFieldViewController.swift
//  DesignSystemDemoApp
//
//  Created by 박준하 on 2023/08/22.
//

import Foundation
import UIKit
import SnapKit
import RxCocoa
import RxSwift
import DesignSystem

public class TextFieldViewController: UIViewController {
    private let disposeBag = DisposeBag()
    
    private let errorMonsterTextField = MonsterTextField()
    private let monsterTextField = MonsterTextField()
    private let eyeTextField = MonsterTextField()
    private let timeMonsterTextField = MonsterTextField()
    
    //Error ⚠️
    public func errorMonsterTextFieldConfigure() {
        view.addSubview(errorMonsterTextField)
        errorMonsterTextField.placeholder = "이메일"
        errorMonsterTextField.emailErrorType = .alreadyUse
        errorMonsterTextField.useShowHideButton = false
    }
    
    // Basic 🥋
    public func monsterTextFieldConfigure() {
        view.addSubview(monsterTextField)
        monsterTextField.placeholder = "이메일"
        monsterTextField.useShowHideButton = false
    }
    
    // Eye 👁️
    public func eyeTextFieldConfigure() {
        view.addSubview(eyeTextField)
        eyeTextField.placeholder = "이메일"
        eyeTextField.useShowHideButton = true
    }
    
    // Timer ⏱️
    public func timeMonsterTextFieldConfigure() {
        view.addSubview(timeMonsterTextField)
        
        timeMonsterTextField.placeholder = "인증번호"
        timeMonsterTextField.useShowHideButton = false
        timeMonsterTextField.useTimer = true
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        monsterTextFieldConfigure()
        errorMonsterTextFieldConfigure()
        eyeTextFieldConfigure()
        timeMonsterTextFieldConfigure()
        setUpConstraints()
        
        Observable.just(TimerState.started)
            .bind(to: timeMonsterTextField._timerState)
            .disposed(by: disposeBag)
        
        timeMonsterTextField.timerState
            .drive(onNext: { state in
                if state == .stopped {
                    print("펑")
                }
            })
            .disposed(by: disposeBag)
    }
    
    private func setUpConstraints() {
        errorMonsterTextField.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20.0)
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(58.0)
        }
        
        monsterTextField.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20.0)
            $0.top.equalTo(errorMonsterTextField.snp.bottom).offset(50.0)
            $0.height.equalTo(58.0)
        }
        
        eyeTextField.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20.0)
            $0.top.equalTo(monsterTextField.snp.bottom).offset(50.0)
            $0.height.equalTo(58.0)
        }
        
        timeMonsterTextField.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20.0)
            $0.top.equalTo(eyeTextField.snp.bottom).offset(50.0)
            $0.height.equalTo(58.0)
        }
    }
}
