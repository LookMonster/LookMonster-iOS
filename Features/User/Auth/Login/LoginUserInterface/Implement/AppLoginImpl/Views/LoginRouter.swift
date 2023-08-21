//
//  LoginRouter.swift
//  LoginUserInterfaceDemoApp
//
//  Created by 박준하 on 2023/08/21.
//  Copyright © 2023 lookMonster.io. All rights reserved.
//
import RIBs
import LoginUserInterface

protocol LoginInteractable: Interactable {
    var router: LoginRouting? { get set }
    var listener: LoginListener? { get set }
}

protocol LoginViewControllable: ViewControllable {

}

final class LoginRouter: ViewableRouter<LoginInteractable, LoginViewControllable>, LoginRouting {

    override init(interactor: LoginInteractable, viewController: LoginViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
