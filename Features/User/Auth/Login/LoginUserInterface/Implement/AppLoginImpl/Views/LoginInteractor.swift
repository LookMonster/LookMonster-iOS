//
//  LoginInteractor.swift
//  LoginUserInterfaceDemoApp
//
//  Created by 박준하 on 2023/08/21.
//  Copyright © 2023 lookMonster.io. All rights reserved.
//

import RIBs
import RxSwift
import DesignSystem
import LoginUserInterface
import Foundation

protocol LoginRouting: ViewableRouting {
    
}

protocol LoginPresentable: Presentable {
    var listener: LoginListener? { get set }
}

final class LoginInteractor: PresentableInteractor<LoginPresentable>,
                             LoginInteractable, LoginListener {

    weak var router: LoginRouting?
    weak var listener: LoginListener?

    override init(presenter: LoginPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    deinit {
        debugPrint("\(self) deinit")
    }

    override func didBecomeActive() {
        super.didBecomeActive()
    }

    override func willResignActive() {
        super.willResignActive()
    }
    
}

//로직 처리 함수
extension LoginInteractor {
    
    func loginButtonDidTap(email: String, password: String) {
        print("ID: \(email)\nPW: \(password)")
    }
    
    func checkGmailTextField(textfield: MonsterTextField) {
        if !checkGmailFormat(emailText: textfield.text) {
            textfield.showError = true
            textfield.emailErrorType = .formatIncorrect
        } else if !checkEmailLength(emailText: textfield.text) {
            textfield.showError = true
            textfield.emailErrorType = .enteredValueExceeded
        } else {
            textfield.showError = false
            textfield.emailErrorType = nil
        }
    }
    
    func checkPasswordTextField(textfield: MonsterTextField) {
        let correctPassword = "85817469"
        
        if textfield.text == correctPassword {
            print("비밀번호가 일치합니다.")
            textfield.showError = false
            textfield.passwordErrorType = nil
        } else {
            textfield.passwordErrorType = .notMatch
            print("비밀번호가 올바르지 않습니다.")
//            fatalError("비밀번호가 올바르지 않습니다.")
        }
    }
}

//로직 함수
extension LoginInteractor {
    
    func checkGmailFormat(emailText: String?) -> Bool {
        guard let emailText = emailText else { return false }
        let emailRegex = "^[\\w.-]+@gmail.com$"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: emailText)
    }
    
    func checkEmailLength(emailText: String?) -> Bool {
        guard let emailText = emailText else { return false }
        return emailText.count <= 30
    }
}
