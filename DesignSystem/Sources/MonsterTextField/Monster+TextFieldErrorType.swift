//
//  Monster+TextFieldErrorType.swift
//  DesignSystemDemoApp
//
//  Created by 박준하 on 2023/08/22.
//

import Foundation
import UIKit

public enum MonsterTextFieldErrorType {
    case emptyInput
    case invalidLength
    case invalidFormat
    
    var message: String {
        switch self {
        case .emptyInput:
            return "입력값이 비어있습니다"
        case .invalidLength:
            return "잘못된 길이의 입력값입니다"
        case .invalidFormat:
            return "입력값의 형식이 잘못되었습니다"
        }
    }
    
    var showError: Bool {
        switch self {
        case .emptyInput, .invalidLength, .invalidFormat:
            return true
        }
    }
}
