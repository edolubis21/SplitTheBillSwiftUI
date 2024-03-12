//
//  AppStateViewModel.swift
//  HiungBagiUang
//
//  Created by edo lubis on 28/02/24.
//

import Foundation

class AppStateViewModel: ObservableObject {
    @Published  var restartApp = true
    
    func onRestartApp() {
        restartApp = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            self.restartApp = true
        }
    }
}
