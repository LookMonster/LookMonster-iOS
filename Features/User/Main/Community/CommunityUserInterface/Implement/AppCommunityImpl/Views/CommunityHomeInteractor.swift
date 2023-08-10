//
//  CommunityHomeInteractor.swift
//  CommunityUserInterfaceDemoApp
//
//  Created by 박준하 on 2023/08/10.
//  Copyright © 2023 lookMonster.io. All rights reserved.
//

import RIBs
import CommunityUserInterface

protocol CommunityHomeRouting: ViewableRouting {
  // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol CommunityHomePresentable: Presentable {
  var listener: CommunityHomePresentableListener? { get set }
  // TODO: Declare methods the interactor can invoke the presenter to present data.
}

final class CommunityHomeInteractor: PresentableInteractor<CommunityHomePresentable>, CommunityHomeInteractable, CommunityHomePresentableListener {
  
  weak var router: CommunityHomeRouting?
  weak var listener: CommunityHomeListener?
  
  // TODO: Add additional dependencies to constructor. Do not perform any logic
  // in constructor.
  override init(presenter: CommunityHomePresentable) {
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
