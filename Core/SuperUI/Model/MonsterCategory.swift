//
//  MonsterCategory.swift
//  CSLogger
//
//  Created by 박준하 on 11/7/23.
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
