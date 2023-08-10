//
//  StyleHomeInterface.swift
//  StyleUserInterface
//
//  Created by 박준하 on 2023/08/10.
//  Copyright © 2023 lookMonster.io. All rights reserved.
//

import Foundation
import RIBs

public protocol StyleHomeBuildable: Buildable {
    func build(withListener listener: StyleHomeListener) -> ViewableRouting
}

public protocol StyleHomeListener: AnyObject {
  // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}
