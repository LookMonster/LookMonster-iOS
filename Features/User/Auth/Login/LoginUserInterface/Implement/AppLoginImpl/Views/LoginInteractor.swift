//
//  LoginInteractor.swift
//  LoginUserInterfaceDemoApp
//
//  Created by 박준하 on 2023/08/21.
//  Copyright © 2023 lookMonster.io. All rights reserved.
//

import RIBs
import RxSwift
import LoginUserInterface

protocol LoginRouting: ViewableRouting {
    
}

protocol LoginPresentable: Presentable {
    var listener: LoginListener? { get set }
    
//    func updateProfileIndex(index: Int?)
}

final class LoginInteractor: PresentableInteractor<LoginPresentable>,
                             LoginInteractable, LoginListener {
    
    weak var router: LoginRouting?
    weak var listener: LoginListener?

    override init(presenter: LoginPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
//        presenter.updateProfileIndex(index: currentImageIndex)
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

extension LoginInteractor {
    
    func loginButtonDidTap() {
        listener?.loginButtonDidTap()
    }
    
    func loginCancel() {
        listener?.loginCancel()
    }
}
