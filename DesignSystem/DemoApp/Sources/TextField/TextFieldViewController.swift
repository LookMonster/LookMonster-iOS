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
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(monsterTextField)
        monsterTextField.placeholder = "Enter text"
        
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
