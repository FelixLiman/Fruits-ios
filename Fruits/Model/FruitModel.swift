//
//  FruitModel.swift
//  Fruits
//
//  Created by Felix Liman on 29/06/21.
//

import Foundation

struct FruitModel: Codable {
    var id: Int
    var name: String
    var type: Int
    var image: String
    var caption: String
    var description: String
    var storage: String
    var preparation: String
}
