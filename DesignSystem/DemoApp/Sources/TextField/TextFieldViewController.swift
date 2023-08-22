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
    
    public func errorMonsterTextField() {
        view.addSubview(monsterTextField)
        monsterTextField.placeholder = "Enter text"
        monsterTextField.errorMessage = "뭔가 잘못된 듯"
        monsterTextField.showError = true
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        errorMonsterTextField()
        setUpConstraints()
    }
    private func setUpConstraints() {
        monsterTextField.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20.0)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(58.0)
        }
    }
}
