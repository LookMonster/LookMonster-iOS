//
//  ShopHomeRouter.swift
//  ShopUserInterfaceDemoApp
//
//  Created by 박준하 on 2023/08/10.
//  Copyright © 2023 lookMonster.io. All rights reserved.
//

import RIBs
import ShopUserInterface

protocol ShopHomeInteractable: Interactable {
  var router: ShopHomeRouting? { get set }
  var listener: ShopHomeListener? { get set }
}

protocol ShopHomeViewControllable: ViewControllable {
  // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class ShopHomeRouter: ViewableRouter<ShopHomeInteractable, ShopHomeViewControllable>, ShopHomeRouting {
  
  // TODO: Constructor inject child builder protocols to allow building children.
  override init(interactor: ShopHomeInteractable, viewController: ShopHomeViewControllable) {
    super.init(interactor: interactor, viewController: viewController)
    interactor.router = self
  }
}
