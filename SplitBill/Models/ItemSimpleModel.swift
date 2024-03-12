//
//  ItemSimpleModel.swift
//  HiungBagiUang
//
//  Created by edo lubis on 25/02/24.
//

import Foundation

struct ItemSimpleModel: Codable, Identifiable, Equatable  {
    var id = UUID()
    let name: String
    let price: Double
    let amount: Int
    var isSelected = false
    var itemSelecteduser: Int?
    var errorName: String?
    var errorPrice: String?
    var errorAmount: String?
}
