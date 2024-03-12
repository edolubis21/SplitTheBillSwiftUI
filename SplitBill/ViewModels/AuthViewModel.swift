//
//  AuthViewModel.swift
//  HiungBagiUang
//
//  Created by edo lubis on 24/02/24.
//

import Foundation

class AuthViewModel: ObservableObject {
    @Published  var isLoggedin: Bool = false
    
    func login() {
        isLoggedin = true
    }
    
    func logout() {
        isLoggedin = false
    }
}
