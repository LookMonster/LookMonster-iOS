//
//  UserProfileHomeDependency.swift
//  StyleUserInterface
//
//  Created by 박준하 on 2023/08/10.
//  Copyright © 2023 lookMonster.io. All rights reserved.
//

import RIBs
import UserProfileUserInterface

public protocol StyleHomeDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class StyleComponent: Component<StyleHomeDependency> {
    
    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

public final class StyleHomeBuilder: Builder<StyleHomeDependency>, StyleHomeBuildable {
    
    public override init(dependency: StyleHomeDependency) {
        super.init(dependency: dependency)
    }
    
    public func build(withListener listener: StyleHomeListener) -> ViewableRouting {
        let _ = StyleHomeComponent(dependency: dependency)
        let viewController =StyleHomeViewController()
        let interactor = StyleHomeInteractor(presenter: viewController)
        interactor.listener = listener
        return StyleHomeRouter(interactor: interactor, viewController: viewController)
    }
}
