//
//  a.swift
//  ShopUserInterface
//
//  Created by 박준하 on 10/11/23.
//  Copyright © 2023 lookMonster.io. All rights reserved.
//

import Foundation

public struct MonsterCategory: Codable {
    public let categoryId: Int
    public let name: String
    
    public init(categoryId: Int, name: String) {
        self.categoryId = categoryId
        self.name = name
    }
}
