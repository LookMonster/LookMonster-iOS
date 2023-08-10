//
//  StyleHomeRouter.swift
//  StyleUserInterface
//
//  Created by 박준하 on 2023/08/10.
//  Copyright © 2023 lookMonster.io. All rights reserved.
//

import RIBs
import StyleUserInterface

protocol StyleHomeInteractable: Interactable {
  var router: StyleHomeRouting? { get set }
  var listener: StyleHomeListener? { get set }
}

protocol StyleHomeViewControllable: ViewControllable {
  // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class StyleHomeRouter: ViewableRouter<StyleHomeInteractable, StyleHomeViewControllable>, StyleHomeRouting {
  
  // TODO: Constructor inject child builder protocols to allow building children.
  override init(interactor: StyleHomeInteractable, viewController: StyleHomeViewControllable) {
    super.init(interactor: interactor, viewController: viewController)
    interactor.router = self
  }
}
