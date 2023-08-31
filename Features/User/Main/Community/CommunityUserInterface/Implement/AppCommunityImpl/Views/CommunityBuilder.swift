//
//  CommunityBuilder.swift
//  CommunityUserInterfaceDemoApp
//
//  Created by 박준하 on 2023/08/29.
//  Copyright © 2023 lookMonster.io. All rights reserved.
//

import RIBs
import CommunityUserInterface

final class CommunityComponent: Component<CommunityDependency> {
    
}

public final class CommunityBuilder: Builder<CommunityDependency>, CommunityBuildable {
    
    public override init(dependency: CommunityDependency) {
        super.init(dependency: dependency)
    }
    
    public func build(withListener listener: CommunityListener, cuttentImageIndex: Int?) -> ViewableRouting {
        let component = Component(dependency: dependency)
        let viewController = CommunityViewController()
        let interactor = CommunityInteractor(presenter: viewController)
        interactor.listener = listener
        
        return CommunityRouter(interactor: interactor, viewController: viewController)
    }
}
