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
    
    private let monsterTextField = MonsterTextField()
    private let errorMonsterTextField = MonsterTextField()
    
    public func monsterTextFieldConfigure() {
        view.addSubview(monsterTextField)
        monsterTextField.placeholder = "Enter text"
        monsterTextField.errorMessage = "뭔가 잘못된 듯"
        monsterTextField.showError = false
    }
    
    public func errorMonsterTextFieldConfigure() {
        view.addSubview(errorMonsterTextField)
        errorMonsterTextField.placeholder = "Enter text"
        errorMonsterTextField.errorMessage = "뭔가 잘못된 듯"
        errorMonsterTextField.showError = true
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
