//
//  ItemsSimpleViewModel.swift
//  HiungBagiUang
//
//  Created by edo lubis on 25/02/24.
//

import Foundation

class FormSimpleViewModel: ObservableObject {
    @Published var items: [ItemSimpleModel] = [ItemSimpleModel(name: "", price: 0.0, amount: 1)]
    @Published var users: [UserSimpleModel] = [UserSimpleModel(name: ""), UserSimpleModel(name: "")]
    @Published var usersSelectedItems: [UserSelectedSimpleModel] = []
    
    @Published  var discountString: String = ""
    @Published var taxServiceString: String = ""
    @Published var taxString: String = ""
    @Published var costDeliveryString: String = ""
    
    @Published  var discount: Double = 0.0
    @Published var taxService: Double = 0.0
    @Published var tax: Double = 0.0
    @Published var costDelivery: Double = 0.0
    
    @Published  var results: [ItemSimpleResultModel] = []
    
    func addItem(_ item: ItemSimpleModel) {
        items.append(item)
    }
    
    func addUser(_ user: UserSimpleModel) {
        users.append(user)
    }
    
    func removeFromIndexItem(_ index: Int) {
        items.remove(at: index)
    }
    
    func removeFromIndexUser(_ index: Int) {
        users.remove(at: index)
    }
    
    func getSubtotal() -> Double {
        var result: Double = 0.0
        for item in items {
            result += (item.price * Double(item.amount))
        }
        return result
    }
    
    func getTotal() -> Double {
        let result = getSubtotal() - discount + taxService + tax + costDelivery
        return result
    }
    
    func onChangeItemAtIndex(_ index: Int, item: ItemSimpleModel){
        items[index] = item
    }
    
    func onChangeUserAtIndex(_ index: Int, user: UserSimpleModel){
        users[index] = user
    }
    
    func onInitUserSelectedSimpleModel() {
        usersSelectedItems = []
        var data: [UserSelectedSimpleModel] = []
        for user in users {
            data.append(UserSelectedSimpleModel(user: user, items: items))
        }
        usersSelectedItems = data
    }
    
    func onAddItemUserAtIndex(_ userIndex: Int, _ index: Int, amount: Int = 1 ){
        if amount != 0 {
            var data: [UserSelectedSimpleModel] = usersSelectedItems
            data[userIndex].items[index].isSelected = true
            data[userIndex].items[index].itemSelecteduser = amount
            usersSelectedItems = data
        }
    }
    
    func onRemoveItemUserAtIndex(_ userIndex: Int, _ index: Int){
        var data: [UserSelectedSimpleModel] = usersSelectedItems
        data[userIndex].items[index].isSelected = false
        data[userIndex].items[index].itemSelecteduser = nil
        usersSelectedItems = data
    }
    
    func onChangeDiscount(_ value: Double) {
        discount = value
    }
    
    func onChangeTaxService(_ value: Double) {
        taxService = value
    }
    
    func onChangeTax(_ value: Double) {
        tax = value
    }
    
    func onChangeCostDelivery(_ value: Double) {
        costDelivery = value
    }
    
    func onCalculateTheResult() {
        var data: [ItemSimpleResultModel] = []
        let totalUser =  Double(usersSelectedItems.count)
        let discountResult = discount / totalUser
        let serviceTaxResult = taxService / totalUser
        let taxResult = tax / totalUser
        let deliveryResult = costDelivery / totalUser
        
        for usersSelectedItem in usersSelectedItems {
            
            var subtotal = 0.0
            for item in usersSelectedItem.items {
                if item.isSelected {
                    subtotal += ( item.price * Double(item.itemSelecteduser ?? 1))
                }
            }
            
            let total = subtotal - discountResult + serviceTaxResult + taxResult + deliveryResult
            
            data.append(ItemSimpleResultModel(subtotal: subtotal, discount: discountResult, serviceTax: serviceTaxResult, tax: taxResult, delivery: deliveryResult, total: total, items: usersSelectedItem.items,user: usersSelectedItem.user))
        }
        results = data
    }
    
    func resetForm() {
        usersSelectedItems = []
        items = [ItemSimpleModel(name: "", price: 0.0, amount: 1)]
        users = [UserSimpleModel(name: ""), UserSimpleModel(name: "")]
        results = []
        discount = 0.0
        taxService = 0.0
        tax = 0.0
        costDelivery = 0.0
        
        discountString = ""
        taxServiceString = ""
        taxString = ""
        costDeliveryString = ""
    }
    
}
