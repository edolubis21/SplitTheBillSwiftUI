//
//  LoginView.swift
//  HiungBagiUang
//
//  Created by edo lubis on 24/02/24.
//

import SwiftUI

struct Loginpage: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Image("google")
                    .resizable()
                    .frame(width: 100, height: 100)
                Spacer()
            }
            VStack {
                Spacer()
                VStack(spacing: 12) {
                    LoginWithGoogleButton(width: .infinity) {
                        authViewModel.login()
                    }
                    .padding(.horizontal, 24)
                    PrimaryButton("Lanjutkan Tanpa Login", width: .infinity) {
                        authViewModel.login()
                    }
                    .padding(.horizontal, 24)
                }
                .padding(.bottom, 36)
            }
        }
        
    }
}

#Preview {
    Loginpage()
        .environmentObject(AuthViewModel())
}
