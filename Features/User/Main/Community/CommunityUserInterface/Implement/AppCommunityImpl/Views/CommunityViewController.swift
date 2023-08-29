//
//  CommunityViewController.swift
//  CommunityUserInterfaceDemoApp
//
//  Created by 박준하 on 2023/08/29.
//  Copyright © 2023 lookMonster.io. All rights reserved.
//

import UIKit
import RIBs
import SnapKit
import Then
import RxCocoa
import RxSwift
import Kingfisher
import SuperUI
import DesignSystem
import ResourceKit
import CommunityUserInterface

class CommunityViewController: UIViewController, CommunityPresentable, CommunityViewControllable {
    
    var listener: CommunityListener?
    
    public var uiviewController: UIViewController {
        return self
    }
    
    public init() {
        super.init(nibName: nil, bundle: nil)
        
        self.bk()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        debugPrint("\(self) deinit")
    }
    
    func bk() {
        view.backgroundColor = .red
    }
    
}
