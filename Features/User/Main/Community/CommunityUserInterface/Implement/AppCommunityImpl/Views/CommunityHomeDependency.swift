//
//  CommunityHomeDependency.swift
//  CommunityUserInterfaceDemoApp
//
//  Created by 박준하 on 2023/08/10.
//  Copyright © 2023 lookMonster.io. All rights reserved.
//

import RIBs
import CommunityUserInterface

public protocol CommunityHomeDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class CommunityHomeComponent: Component<CommunityHomeDependency> {
    
    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

public final class CommunityHomeBuilder: Builder<CommunityHomeDependency>, CommunityHomeBuildable {
    
    public override init(dependency: CommunityHomeDependency) {
        super.init(dependency: dependency)
    }
    
    public func build(withListener listener: CommunityHomeListener) -> ViewableRouting {
        let _ = CommunityHomeComponent(dependency: dependency)
        let viewController = CommunityHomeViewController()
        let interactor = CommunityHomeInteractor(presenter: viewController)
        interactor.listener = listener
        return CommunityHomeRouter(interactor: interactor, viewController: viewController)
    }
}
