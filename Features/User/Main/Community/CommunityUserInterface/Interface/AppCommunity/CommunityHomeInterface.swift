//
//  CommunityHomeInterface.swift
//  CommunityUserInterfaceDemoApp
//
//  Created by 박준하 on 2023/08/10.
//  Copyright © 2023 lookMonster.io. All rights reserved.
//

import Foundation
import RIBs

public protocol CommunityHomeBuildable: Buildable {
    func build(withListener listener: CommunityHomeListener) -> ViewableRouting
}

public protocol CommunityHomeListener: AnyObject {
  // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}
