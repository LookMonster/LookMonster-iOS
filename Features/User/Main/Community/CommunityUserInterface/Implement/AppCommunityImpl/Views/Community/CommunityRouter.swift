//
//  CommunityRouter.swift
//  CommunityUserInterfaceDemoApp
//
//  Created by 박준하 on 2023/08/29.
//  Copyright © 2023 lookMonster.io. All rights reserved.
//

import RIBs
import CommunityUserInterface

protocol CommunityInteractable: Interactable {
    var router: CommunityRouting? { get set}
    var listener: CommunityListener? { get set}
}

protocol CommunityViewControllable: ViewControllable {
    
}

final class CommunityRouter: ViewableRouter<CommunityInteractable, CommunityViewControllable>, CommunityRouting {
    
    override init(interactor: CommunityInteractable, viewController: CommunityViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
