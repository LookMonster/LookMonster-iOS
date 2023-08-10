//
//  CommunityHomeRouter.swift
//  CommunityUserInterfaceDemoApp
//
//  Created by 박준하 on 2023/08/10.
//  Copyright © 2023 lookMonster.io. All rights reserved.
//

import Foundation
import RIBs
import CommunityUserInterface

protocol CommunityHomeInteractable: Interactable {
  var router: CommunityHomeRouting? { get set }
  var listener: CommunityHomeListener? { get set }
}

protocol CommunityHomeViewControllable: ViewControllable {
  // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class CommunityHomeRouter: ViewableRouter<CommunityHomeInteractable, CommunityHomeViewControllable>, CommunityHomeRouting {
  
  // TODO: Constructor inject child builder protocols to allow building children.
  override init(interactor: CommunityHomeInteractable, viewController: CommunityHomeViewControllable) {
    super.init(interactor: interactor, viewController: viewController)
    interactor.router = self
  }
}
