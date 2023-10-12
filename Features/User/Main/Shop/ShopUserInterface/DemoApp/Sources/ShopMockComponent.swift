//
//  ShopMockComponent.swift
//  ShopUserInterfaceDemoApp
//
//  Created by 박준하 on 10/10/23.
//  Copyright © 2023 lookMonster.io. All rights reserved.
//

import UIKit
import RIBs
import DesignSystem
import ShopUserInterface
import ShopUserInterfaceImpl
import TokenManager
import TokenManagerImpl
import LKNetwork
import LKNetworkImpl
import ShopData

import RxSwift
import RxCocoa

final class ShopMockComponent: Component<EmptyDependency>, ShopHomeDependency {
    
    lazy var shopBuildable: ShopHomeBuildable = {
        return ShopHomeBuilder(dependency: self)
    }() as! ShopHomeBuildable
    
    init() {
        super.init(dependency: EmptyComponent())
    }
}
