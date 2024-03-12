//
//  UserSimpleModel.swift
//  HiungBagiUang
//
//  Created by edo lubis on 27/02/24.
//

import Foundation

struct UserSimpleModel: Codable, Identifiable, Equatable {
    var id = UUID()
    let name: String
}
