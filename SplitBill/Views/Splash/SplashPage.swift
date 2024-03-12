//
//  SplashPage.swift
//  HiungBagiUang
//
//  Created by edo lubis on 28/02/24.
//

import SwiftUI

struct SplashPage: View {
    
    @State var isShowSplash = true
    
    var body: some View {
        ZStack {
            if isShowSplash {
                GeometryReader { geometry in
                    VStack {
                        Image("SplitTheBill")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100)
                            .foregroundColor(.white)
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .background(AppColor.primary)
                }
                
            }
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1 ){
                isShowSplash = false
            }
        }
    }
    
}

#Preview {
    SplashPage()
}
