//
//  ShopHomeDependency.swift
//  ShopUserInterfaceDemoApp
//
//  Created by 박준하 on 2023/08/10.
//  Copyright © 2023 lookMonster.io. All rights reserved.
//

import RIBs
import ShopUserInterface

public protocol ShopHomeDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class ShopHomeComponent: Component<ShopHomeDependency> {
    
    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

public final class ShopHomeBuilder: Builder<ShopHomeDependency>, ShopHomeBuildable {
    
    public override init(dependency: ShopHomeDependency) {
        super.init(dependency: dependency)
    }
    
    public func build(withListener listener: ShopHomeListener) -> ViewableRouting {
        let _ = ShopHomeComponent(dependency: dependency)
        let viewController = ShopHomeViewController()
        let interactor = ShopHomeInteractor(presenter: viewController)
        interactor.listener = listener
        return ShopHomeRouter(interactor: interactor, viewController: viewController)
    }
}
