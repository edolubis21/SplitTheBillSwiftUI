//
//  ItemResult.swift
//  HiungBagiUang
//
//  Created by edo lubis on 28/02/24.
//

import SwiftUI
import WrappingHStack

struct ItemResult: View {
    
    let currencyFormatter = CurrencyFormatter()
    
    let index: Int
    let result: ItemSimpleResultModel
    
    func getUserName() -> String {
        if result.user.name.isEmpty {
            return "Nama \(index + 1)"
        }
        return result.user.name
    }
    
    func getItemName(index: Int)-> String {
        let item = result.items[index]
        let name = item.name
        let numberSelected = item.itemSelecteduser ?? 0 > 1 ? " (\(item.itemSelecteduser ?? 0))" : ""
        if name.isEmpty {
            return "item \(index + 1)\(numberSelected)"
        }
        return "\(name)\(numberSelected)"
    }
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("\(getUserName())")
                        .font(.system(size: 16, weight: .semibold))
                    Text("item yang di beli:")
                        .foregroundColor(.gray)
                    WrappingHStack(result.items.indices, id:\.self, lineSpacing: 8) {index in
                        if result.items[index].isSelected {
                            Text("\(getItemName(index: index))")
                                .padding(.horizontal, 12)
                                .padding(.vertical, 4)
                                .foregroundColor(.white)
                                .background(AppColor.primary)
                                .cornerRadius(4.0)
                        }
                    }
                }
                Spacer()
            }
            Divider()
            VStack(spacing: 8) {
                HStack {
                    Text("Subtotal")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.gray)
                    Spacer()
                    Text("\(currencyFormatter.numberToCurrency(result.subtotal))")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.gray)
                }
                HStack {
                    Text("Diskon")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.gray)
                    Spacer()
                    Text("\(currencyFormatter.numberToCurrency(result.discount))")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.gray)
                }
                HStack {
                    Text("Pajak Layanan")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.gray)
                    Spacer()
                    Text("\(currencyFormatter.numberToCurrency(result.serviceTax))")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.gray)
                }
                HStack {
                    Text("Pajak")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.gray)
                    Spacer()
                    Text("\(currencyFormatter.numberToCurrency(result.tax))")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.gray)
                }
                HStack {
                    Text("Biaya Pengiriman")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.gray)
                    Spacer()
                    Text("\(currencyFormatter.numberToCurrency(result.delivery))")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.gray)
                }
            }
            Divider()
            HStack {
                Text("Total")
                    .font(.system(size: 18, weight: .semibold))
                Spacer()
                Text("\(currencyFormatter.numberToCurrency(result.total))")
                    .font(.system(size: 18, weight: .semibold))
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
    ItemResult(index: 0, result: ItemSimpleResultModel(subtotal: 0, discount: 0, serviceTax: 0, tax: 0, delivery: 0, total: 0, items: [], user: UserSimpleModel(name: "")))
}
