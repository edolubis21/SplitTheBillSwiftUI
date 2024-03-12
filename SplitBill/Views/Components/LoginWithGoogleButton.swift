//
//  LoginWithGoogleBUtton.swift
//  HiungBagiUang
//
//  Created by edo lubis on 24/02/24.
//

import SwiftUI

struct LoginWithGoogleButton: View {
    let action: () -> Void
    let width: CGFloat?
    let height: CGFloat
    
    init(width: CGFloat? = nil, height: CGFloat = 30,  action:  @escaping () -> Void) {
        self.width = width
        self.action = action
        self.height = height
    }
    
    var body: some View {
        Button(action: action, label: {
            HStack {
                Image("google")
                    .resizable()
                    .frame(width: 30,height: 30)
                Text("Login Dengan Google")
            }
            .font(.system(size: 18, weight: .semibold))
            .frame(maxWidth: width)
            .frame(height: height)
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .foregroundColor(.black)
            .background(.white)
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(.gray, lineWidth: 1)
            )
        })
        
    }
}

#Preview {
    LoginWithGoogleButton {}
}
