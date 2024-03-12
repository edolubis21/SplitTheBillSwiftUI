//
//  SelectItemSelectedUserPage.swift
//  HiungBagiUang
//
//  Created by edo lubis on 27/02/24.
//

import SwiftUI

struct SimpleSelectItemUserPage: View {
    
    @EnvironmentObject var formSimpleViewModel: FormSimpleViewModel
    @State private var didInit = false
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    ForEach(formSimpleViewModel.usersSelectedItems.indices, id: \.self) { index in
                        ItemSelectUser(geometry: geometry, index: index, userSelected: formSimpleViewModel.usersSelectedItems[index] )
                    }
                    
                    NavigationLink {
                        SimpleResultPage()
                    } label: {
                        Text("Lanjut")
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 12)
                            .foregroundColor(.white)
                            .background(AppColor.primary)
                            .cornerRadius(4.0)
                    }.padding(.horizontal, 24)
                    
                }
            }
        }
        .navigationTitle("Pilih item yang dibeli")
        .onAppear {
            if !didInit {
                didInit = true
                formSimpleViewModel.onInitUserSelectedSimpleModel()
            }
        }
    }
}

#Preview {
    SimpleSelectItemUserPage()
        .environmentObject(FormSimpleViewModel())
}
