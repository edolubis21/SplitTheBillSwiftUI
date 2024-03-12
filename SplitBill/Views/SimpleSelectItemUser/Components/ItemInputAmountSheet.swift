//
//  itemInputAmountSheet.swift
//  HiungBagiUang
//
//  Created by edo lubis on 27/02/24.
//

import SwiftUI

struct ItemInputAmountSheet: View {
    
    @State var amountItem = ""
    @Binding var item: ItemSimpleModel?
    let user: UserSimpleModel
    let callBack:(Int) -> Void
    
    func getUserName()-> String {
        let name = user.name;
        if name.isEmpty {
            return "pengguna"
        }
        return name
    }
    
    func getItemName()-> String {
        let item = item?.name;
        if item?.isEmpty ?? false {
            return "item"
        }
        return item ?? "item"
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Masukkan jumlah \(getItemName()) yang di beli \(getUserName())")
                .lineLimit(0)
            TextField("Masukkan input",text:  $amountItem)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
            PrimaryButton("Tambah", width: .infinity) {
                callBack(Int(amountItem) ?? 0 )
            }
            Spacer()
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 24)
    }
}

#Preview {
    @State var item: ItemSimpleModel? = nil
    return ItemInputAmountSheet(item: $item, user: UserSimpleModel(name: "")) { _ in
        
    }
}
