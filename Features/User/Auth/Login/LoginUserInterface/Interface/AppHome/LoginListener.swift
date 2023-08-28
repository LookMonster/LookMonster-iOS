//
//  LoginListener.swift
//  LoginUserInterfaceDemoApp
//
//  Created by 박준하 on 2023/08/21.
//  Copyright © 2023 lookMonster.io. All rights reserved.
//

import RIBs
import UIKit
import DesignSystem

public protocol LoginListener: AnyObject {
    
    func loginButtonDidTap(email: String, password: String)

    func checkGmailTextField(textfield: MonsterTextField)
    
    
}
