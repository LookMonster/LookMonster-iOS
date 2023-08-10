//
//  StyleHomeInteractor.swift
//  StyleUserInterface
//
//  Created by 박준하 on 2023/08/10.
//  Copyright © 2023 lookMonster.io. All rights reserved.
//

import RIBs
import UserProfileUserInterface

protocol StyleHomeRouting: ViewableRouting {
  // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol StyleHomePresentable: Presentable {
  var listener: StyleHomePresentableListener? { get set }
  // TODO: Declare methods the interactor can invoke the presenter to present data.
}

final class UserProfileHomeInteractor: PresentableInteractor<StyleHomePresentable>, StyleHomeInteractable, StyleHomePresentableListener {
  
  weak var router: StyleHomeRouting?
  weak var listener: StyleHomeListener?
  
  // TODO: Add additional dependencies to constructor. Do not perform any logic
  // in constructor.
  override init(presenter: StyleHomePresentable) {
    super.init(presenter: presenter)
    presenter.listener = self
  }
  
  override func didBecomeActive() {
    super.didBecomeActive()
    // TODO: Implement business logic here.
  }
  
  override func willResignActive() {
    super.willResignActive()
    // TODO: Pause any business logic.
  }
}
