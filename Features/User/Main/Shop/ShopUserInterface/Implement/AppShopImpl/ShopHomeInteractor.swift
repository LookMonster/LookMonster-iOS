//
//  ShopHomeInteractor.swift
//  ShopUserInterfaceDemoApp
//
//  Created by 박준하 on 2023/08/10.
//  Copyright © 2023 lookMonster.io. All rights reserved.
//

import RIBs
import ShopUserInterface

protocol ShopHomeRouting: ViewableRouting {
  // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol ShopHomePresentable: Presentable {
  var listener: ShopHomePresentableListener? { get set }
  // TODO: Declare methods the interactor can invoke the presenter to present data.
}

final class ShopHomeInteractor: PresentableInteractor<ShopHomePresentable>, ShopHomeInteractable, ShopHomePresentableListener {
  
  weak var router: ShopHomeRouting?
  weak var listener: ShopHomeListener?
  
  // TODO: Add additional dependencies to constructor. Do not perform any logic
  // in constructor.
  override init(presenter: ShopHomePresentable) {
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
