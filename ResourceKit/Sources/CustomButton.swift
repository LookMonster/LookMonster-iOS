//
//  CustomButton.swift
//  ResourceKit
//
//  Created by 박준하 on 2023/07/31.
//  Copyright © 2023 lookMonster.io. All rights reserved.
//

import Foundation
import UIKit

open class CustomButton: UIButton {
    
    public init(
        title: String,
        backgroundColor: UIColor,
        titleColor: UIColor,
        font: UIFont? = UIFont.systemFont(ofSize: 15, weight: .bold)
    ) {
        let frame = CGRect(x: 0, y: 0, width: 353, height: 55)
        super.init(frame: frame)
        
        self.backgroundColor = backgroundColor
        setTitleColor(titleColor, for: .normal)
        
        layer.cornerRadius = 10
        
        setTitle(title, for: .normal)
        titleLabel?.font = font
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
