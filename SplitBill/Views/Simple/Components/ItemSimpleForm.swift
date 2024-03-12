//
//  ItemSimpleForm.swift
//  HiungBagiUang
//
//  Created by edo lubis on 25/02/24.
//

import SwiftUI

struct ItemSimpleForm: View {
    
    let currencyFormatter = CurrencyFormatter()
    @EnvironmentObject var formSimpleViewModel: FormSimpleViewModel
    @State private var name: String = ""
    @State private var price: String = ""
    @State private var amount: String = ""
    let index: Int
    
    var body: some View {
        HStack {
            VStack {
                TextField("Masukkan Nama Item \(index + 1)",text: $name)
                    .textFieldStyle(.roundedBorder)
                    .onChange(of: name) { newValue in
                        formSimpleViewModel.onChangeItemAtIndex(index, item: ItemSimpleModel( name: newValue, price: Double(currencyFormatter.currencyToNumberString(price)) ?? 0.0, amount: Int(amount) ?? 1))
                    }
                CurrencyTextField("Masukkan Harga Item", text: $price)
                    .onChange(of: price) { newValue in
                        formSimpleViewModel.onChangeItemAtIndex(index, item: ItemSimpleModel(name: name, price: Double(currencyFormatter.currencyToNumberString(newValue)) ?? 0.0, amount: Int(amount) ?? 1))
                    }
                TextField("Masukkan jumlah item yang dibeli",text: $amount)
                    .keyboardType(.numberPad)
                    .textFieldStyle(.roundedBorder)
                    .onChange(of: amount) { newValue in
                        formSimpleViewModel.onChangeItemAtIndex(index, item: ItemSimpleModel(name: name, price: Double(currencyFormatter.currencyToNumberString(price)) ?? 0.0, amount: Int(newValue) ?? 1))
                    }
            }
            VStack{
                Button  {
                    formSimpleViewModel.removeFromIndexItem(index)
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
    ItemSimpleForm(index: 0)
        .environmentObject(FormSimpleViewModel())
}
