//
//  TextFieldViewController.swift
//  DesignSystemDemoApp
//
//  Created by 박준하 on 2023/08/22.
//

import Foundation
import UIKit
import SnapKit

public class TextFieldViewController: UIViewController {
    
    private let errorMonsterTextField = MonsterTextField()
    private let monsterTextField = MonsterTextField()
    
    public func errorMonsterTextFieldConfigure() {
        view.addSubview(errorMonsterTextField)
        errorMonsterTextField.placeholder = "이메일"
        errorMonsterTextField.errorType = .emptyInput
    }
    
    
    public func monsterTextFieldConfigure() {
        view.addSubview(monsterTextField)
        monsterTextField.placeholder = "이메일"
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        monsterTextFieldConfigure()
        errorMonsterTextFieldConfigure()
        setUpConstraints()
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
    }
}
