//
//  itemSimpleAddUserForm.swift
//  HiungBagiUang
//
//  Created by edo lubis on 27/02/24.
//

import SwiftUI

struct itemSimpleAddUserForm: View {
    
    let currencyFormatter = CurrencyFormatter()
    @EnvironmentObject var formSimpleViewModel: FormSimpleViewModel
    @State private var name: String = ""
    let geometri: GeometryProxy
    let index: Int
    
    var body: some View {
        HStack {
            VStack {
                TextField("Masukkan Nama \(index + 1)",text: $name)
                    .textFieldStyle(.roundedBorder)
                    .onChange(of: name) { newValue in
                        formSimpleViewModel.onChangeUserAtIndex(index, user: UserSimpleModel(name: newValue))
                    }
            }
            VStack{
                Button  {
                    formSimpleViewModel.removeFromIndexUser(index)
                } label: {
                    Image(systemName: "trash.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.red)
                    
                }
                
            }
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 8)
        .background(Color(UIColor.systemGray6.cgColor))
        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
        .padding(.horizontal, 24)
    }
}

#Preview {
    GeometryReader { geometri in
        itemSimpleAddUserForm(geometri: geometri, index: 0)
    }
    .environmentObject(FormSimpleViewModel())
}
