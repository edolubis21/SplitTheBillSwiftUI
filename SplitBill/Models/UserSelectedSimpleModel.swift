//
//  UserSelectedSimpleModel.swift
//  HiungBagiUang
//
//  Created by edo lubis on 28/02/24.
//

import Foundation

struct UserSelectedSimpleModel: Codable, Identifiable, Equatable {
    var id = UUID()
    let user: UserSimpleModel
    var items: [ItemSimpleModel]
}
