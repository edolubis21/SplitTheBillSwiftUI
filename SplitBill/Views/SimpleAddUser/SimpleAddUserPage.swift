//
//  SimpleAddUserPage.swift
//  HiungBagiUang
//
//  Created by edo lubis on 27/02/24.
//

import SwiftUI

struct SimpleAddUserPage: View {
    
    @EnvironmentObject var formSimpleViewModel: FormSimpleViewModel
    
    var body: some View {
        GeometryReader { geometri in
            ScrollView {
                VStack {
                    ForEach(0..<formSimpleViewModel.users.count, id: \.self) { index in
                        itemSimpleAddUserForm(geometri: geometri, index: index)
                    }
                }
                HStack {
                    Spacer()
                    Button(action: {
                        formSimpleViewModel.addUser(UserSimpleModel(name: ""))
                    }, label: {
                        Text("Tambah Nama")
                        Image(systemName: "plus")
                    })

                }
                .padding(.horizontal, 24)
                .padding(.bottom, 12)
                
                NavigationLink {
                    SimpleSelectItemUserPage()
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
        .navigationTitle("Tambahkan Nama")
    }
}

#Preview {
    SimpleAddUserPage()
        .environmentObject(FormSimpleViewModel())
}
