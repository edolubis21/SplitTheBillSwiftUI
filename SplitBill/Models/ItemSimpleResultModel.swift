//
//  itemSimpleResultModel.swift
//  HiungBagiUang
//
//  Created by edo lubis on 28/02/24.
//

import Foundation

struct ItemSimpleResultModel: Codable, Identifiable, Equatable {
    var id = UUID()
    let subtotal: Double
    let discount: Double
    let serviceTax: Double
    let tax: Double
    let delivery: Double
    let total: Double
    var items: [ItemSimpleModel]
    let user: UserSimpleModel
}
