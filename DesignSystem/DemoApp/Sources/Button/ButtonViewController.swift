//
//  ButtonViewController.swift
//  DesignSystemDemoApp
//
//  Created by 박준하 on 2023/08/23.
//

import Foundation
import UIKit
import SnapKit
import RxCocoa
import RxSwift
import DesignSystem
import ResourceKit

public class ButtonViewController: UIViewController {
    private let disposeBag = DisposeBag()
    
    var AppleButton = MonsterAuthButton(image: ResourceKitAsset.appleIcon.image, title: "apple로 시작하기", backgorundColor: .black, titleColor: .white)
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(AppleButton)
        
        AppleButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview().inset(24.0)
            $0.height.equalTo(48.0)
        }
    }
    
}
