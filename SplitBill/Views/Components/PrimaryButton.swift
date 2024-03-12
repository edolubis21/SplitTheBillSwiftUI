//
//  PrimaryButton.swift
//  HiungBagiUang
//
//  Created by edo lubis on 24/02/24.
//

import SwiftUI

struct PrimaryButton: View  {
    let title: String
    let action: () -> Void
    let width: CGFloat?
    let height: CGFloat
    
    init(_ title: String, width: CGFloat? = nil, height: CGFloat = 30, action: @escaping () -> Void) {
        self.title = title
        self.action = action
        self.width = width
        self.height = height
    }
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 18, weight: .semibold))
                .frame(maxWidth: width)
                .frame(height: height)
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .foregroundColor(.white)
                .background(AppColor.primary)
                .cornerRadius(4.0)
        
        }
    }
}


#Preview {
    PrimaryButton("Hello") {
    
    }
}
