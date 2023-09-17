//
//  HomeUserInterfaceMockComponent.swift
//  HomeUserInterfaceDemoApp
//
//  Created by 박준하 on 2023/09/17.
//  Copyright © 2023 lookMonster.io. All rights reserved.
//

import UIKit
import RIBs
import DesignSystem
import HomeUserInterface
import HomeUserInterfaceImpl
import TokenManager
import TokenManagerImpl
import LKNetwork
import LKNetworkImpl

import RxCocoa
import RxSwift

final class AppHomeMockComponent: Component<EmptyDependency>, HomeDependency, AppHomeDependency {
    
    lazy var homeBuildable: HomeBuildable = {
        return AppHomeBuilder(dependency: self)
    }() as! HomeBuildable
    
    init() {
        super.init(dependency: EmptyComponent())
    }
}
