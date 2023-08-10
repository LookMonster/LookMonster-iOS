//
//  ShopHomeInterface.swift
//  ShopUserInterfaceDemoApp
//
//  Created by 박준하 on 2023/08/10.
//  Copyright © 2023 lookMonster.io. All rights reserved.
//

import Foundation
import RIBs

public protocol ShopHomeBuildable: Buildable {
    func build(withListener listener: ShopHomeListener) -> ViewableRouting
}

public protocol ShopHomeListener: AnyObject {
  // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}
