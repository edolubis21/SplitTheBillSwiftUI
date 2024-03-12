//
//  ItemSelectUser.swift
//  HiungBagiUang
//
//  Created by edo lubis on 27/02/24.
//

import SwiftUI
import WrappingHStack

struct ItemSelectUser: View {
    
    @EnvironmentObject var formSimpleViewModel: FormSimpleViewModel
    @State var isShowModal = false
    @State var selectedItem: ItemSimpleModel?
    @State var selectedIndex: Int?
    
    let geometry: GeometryProxy
    let index: Int
    let userSelected: UserSelectedSimpleModel
    
    func getUserName() -> String {
        if userSelected.user.name.isEmpty {
            return "Nama \(index + 1)"
        }
        return userSelected.user.name
    }
    
    func getItemName(index: Int)-> String {
        let item =  userSelected.items[index]
        let name = item.name;
        let number = item.amount > 1 ? " (\(item.amount))" : ""
        let numberSelected = item.itemSelecteduser ?? 0 > 1 ? " (\(item.itemSelecteduser ?? 0))" : ""
        if name.isEmpty {
            return "item \(index + 1)\(item.isSelected ? numberSelected : number)"
        }
        return "\(name)\(item.isSelected ? numberSelected : number)"
    }
    
    func isItemSelected(index: Int) -> Bool {
        let items = userSelected.items
        let item = items[index]
        return item.isSelected
    }
    
    func addItemUser(index: Int) {
        let items = userSelected.items
        let item = items[index]
        
        if (item.amount > 1) {
            selectedIndex = index
            selectedItem = item
            isShowModal = true
            return
        }
        formSimpleViewModel.onAddItemUserAtIndex(self.index, index)
    }
    
    func removeItemUser(index: Int) {
        formSimpleViewModel.onRemoveItemUserAtIndex(self.index, index)
    }
    
    
    var body: some View {
        VStack {
            HStack {
                Text("Pilih Item yang di beli \(Text("\(getUserName())").fontWeight(.semibold))")
                Spacer()
            }
            WrappingHStack(userSelected.items.indices, id:\.self, lineSpacing: 8) {index in
                Button(action: {
                    if isItemSelected(index: index)  {
                        removeItemUser(index: index)
                    } else {
                        addItemUser(index: index)
                    }
                }, label: {
                    if !isItemSelected(index: index)  {
                        HStack {
                            Image(systemName: "plus.circle.fill")
                            Text("\(getItemName(index: index))")
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 4)
                        .overlay(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(AppColor.primary, lineWidth: 1)
                        )
                    } else {
                        HStack {
                            Image(systemName: "minus.circle.fill")
                            Text("\(getItemName(index: index))")
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 4)
                        .foregroundColor(.white)
                        .background(AppColor.primary)
                        .cornerRadius(4.0)
                    }
                })
            }
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 8)
        .background(Color(UIColor.systemGray6.cgColor))
        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
        .padding(.horizontal, 24)
        .sheet(isPresented: $isShowModal, content: {
            if #available(iOS 16.0, *) {
                ItemInputAmountSheet(item: $selectedItem, user: userSelected.user) { value in
                    if selectedIndex != nil {
                        formSimpleViewModel.onAddItemUserAtIndex(self.index, selectedIndex!, amount: value)
                    }
                    isShowModal = false
                    selectedItem = nil
                    selectedIndex = nil
                }
                .presentationDetents([.height(160)])
            } else {
                ItemInputAmountSheet(item: $selectedItem, user: userSelected.user) { value in
                    if selectedIndex != nil {
                        formSimpleViewModel.onAddItemUserAtIndex(self.index, selectedIndex!, amount: value)
                    }
                    isShowModal = false
                    selectedItem = nil
                    selectedIndex = nil
                }
            }
        })
    }
    
}



#Preview {
    GeometryReader { geometry in
        ItemSelectUser(geometry: geometry, index: 0,userSelected: UserSelectedSimpleModel(id: UUID(), user: UserSimpleModel(id: UUID(), name: ""), items: []))
    }
    .environmentObject(FormSimpleViewModel())
}
