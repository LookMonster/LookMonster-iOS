//
//  CommunityBuildable.swift
//  CommunityUserInterfaceDemoApp
//
//  Created by 박준하 on 2023/08/29.
//  Copyright © 2023 lookMonster.io. All rights reserved.
//

import RIBs

public protocol CommunityBuildable: Buildable {
    func build(withListener listener: CommunityListener , cuttentImageIndex: Int?) -> ViewableRouting
}
