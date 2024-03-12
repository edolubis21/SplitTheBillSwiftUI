//
//  SplitBillApp.swift
//  SplitBill
//
//  Created by edo lubis on 12/03/24.
//

import SwiftUI

@main
struct SplitBillApp: App {
    
    @StateObject private var authViewModel = AuthViewModel()
    @StateObject private var itemsSimpleViewModel = FormSimpleViewModel()
    @StateObject private var appStateViewModel = AppStateViewModel()
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                if authViewModel.isLoggedin {
                    if appStateViewModel.restartApp {
                        ContentView()
                            .environmentObject(authViewModel)
                            .environmentObject(itemsSimpleViewModel)
                            .environmentObject(appStateViewModel)
                    }
                    
                } else {
                    Loginpage()
                        .environmentObject(authViewModel)
                }
                SplashPage()
            }
        }
    }
}
