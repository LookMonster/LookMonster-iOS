//
//  DropDownViewController.swift
//  DesignSystemDemoApp
//
//  Created by 박준하 on 2023/08/23.
//

import UIKit
import SnapKit

class DropDownViewController: UIViewController {
    
    let dropdownView = MonsterDropdownView()
    
    override func viewDidLoad() {
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
