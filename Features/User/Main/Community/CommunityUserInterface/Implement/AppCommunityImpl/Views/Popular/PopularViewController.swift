//
//  PopularViewController.swift
//  CommunityUserInterfaceTests
//
//  Created by 박준하 on 2023/09/08.
//  Copyright © 2023 lookMonster.io. All rights reserved.
//

import UIKit
import CommunityUserInterface

class PopularViewController: UIViewController, PopularPresentable, PopularViewControllable, PopularListener  {
    var listener: PopularListener?
    
    public var uiviewController: UIViewController {
        return self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
    }
    
    func communityBackground() {
        print("asdf")
    }
}
