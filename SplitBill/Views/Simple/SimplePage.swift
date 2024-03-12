//
//  SimplePage.swift
//  HiungBagiUang
//
//  Created by edo lubis on 24/02/24.
//

import SwiftUI

struct SimplePage: View {
    
    let currencyFormatter = CurrencyFormatter()
    
    @EnvironmentObject var formSimpleViewModel: FormSimpleViewModel
    
    @State private var isShowALert = false
    
    
    func isFormValid()-> Bool {
        for data in formSimpleViewModel.items {
            if data.price != 0 {
                return true
            }
        }
        return false
    }
    
    var body: some View {
        GeometryReader { geometri in
            ScrollView {
                VStack {
                    VStack {
                        ForEach (0..<formSimpleViewModel.items.count, id: \.self) { index in
                            ItemSimpleForm(index: index)
                                .id(index)
                        }
                    }
                    HStack {
                        Spacer()
                        Button(action: {
                            formSimpleViewModel.addItem(ItemSimpleModel(name: "", price: 0.0, amount: 1))
                        }, label: {
                            Text("Tambah Item")
                            Image(systemName: "plus")
                        })
                        
                    }
                    .padding(.horizontal, 24)
                    .padding(.bottom, 12)
                    VStack {
                        HStack {
                            Text("Subtotal")
                                .font(.system(size: 16,weight: .semibold))
                                .foregroundColor(.gray)
                            Spacer()
                            Text("\(currencyFormatter.numberToCurrency(formSimpleViewModel.getSubtotal()))")
                                .font(.system(size: 16,weight: .semibold))
                                .foregroundColor(.gray)
                        }
                        Divider()
                            .padding(.vertical, 4)
                        HStack {
                            Text("Diskon")
                                .font(.system(size: 16,weight: .semibold))
                                .foregroundColor(.gray)
                            Spacer()
                            CurrencyTextField("0", text: $formSimpleViewModel.discountString)
                            
                                .onChange(of: formSimpleViewModel.discountString){ newValue in                              formSimpleViewModel.onChangeDiscount(Double(currencyFormatter.currencyToNumberString(newValue)) ?? 0.0)
                                }
                                .multilineTextAlignment(.trailing)
                                .frame(width: geometri.size.width / 2)
                            
                        }
                        HStack {
                            Text("Pajak Layanan")
                                .font(.system(size: 16,weight: .semibold))
                                .foregroundColor(.gray)
                            Spacer()
                            CurrencyTextField("0", text: $formSimpleViewModel.taxServiceString)
                                .onChange(of: formSimpleViewModel.taxServiceString){ newValue in
                                    formSimpleViewModel.onChangeTaxService(Double(currencyFormatter.currencyToNumberString(newValue)) ?? 0.0)
                                }
                                .multilineTextAlignment(.trailing)
                                .frame(width: geometri.size.width / 2)
                        }
                        HStack {
                            Text("Pajak")
                                .font(.system(size: 16,weight: .semibold))
                                .foregroundColor(.gray)
                            Spacer()
                            CurrencyTextField("0", text: $formSimpleViewModel.taxString)
                                .onChange(of: formSimpleViewModel.taxString){ newValue in
                                    formSimpleViewModel.onChangeTax(Double(currencyFormatter.currencyToNumberString(newValue)) ?? 0.0)
                                }
                                .multilineTextAlignment(.trailing)
                                .frame(width: geometri.size.width / 2)
                        }
                        HStack {
                            Text("Biaya Pengiriman")
                                .font(.system(size: 16,weight: .semibold))
                                .foregroundColor(.gray)
                            Spacer()
                            CurrencyTextField("0", text: $formSimpleViewModel.costDeliveryString)
                                .onChange(of: formSimpleViewModel.costDeliveryString){ newValue in
                                    formSimpleViewModel.onChangeCostDelivery(Double(currencyFormatter.currencyToNumberString(newValue)) ?? 0.0)
                                }
                                .multilineTextAlignment(.trailing)
                                .frame(width: geometri.size.width / 2)
                        }
                        Divider()
                            .padding(.vertical, 4)
                        HStack {
                            Text("Total")
                                .font(.system(size: 18, weight: .semibold))
                            Spacer()
                            Text("\(currencyFormatter.numberToCurrency(formSimpleViewModel.getTotal()))")
                                .font(.system(size: 18, weight: .semibold))
                        }
                    }
                    .padding(.vertical, 8)
                    .padding(.horizontal, 8)
                    .background(Color(UIColor.systemGray6.cgColor))
                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                    .padding(.horizontal, 24)
                    
                    if isFormValid() {
                        NavigationLink {
                            SimpleAddUserPage()
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
                    } else {
                        PrimaryButton("Lanjut", width: .infinity) {
                            isShowALert = true
                        }
                        .padding(.horizontal, 24)
                    }
                    
                    
                }
                .navigationTitle("Split the bill")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            formSimpleViewModel.resetForm()
                        } label: {
                            Text("Reset")
                            Image(systemName: "arrow.counterclockwise")
                                .foregroundColor(.accentColor)
                        }
                        
                    }
                }
                .alert(isPresented: $isShowALert) {
                    Alert(
                        title: Text("Tambakah minimal 1 item dengan Harga untuk melanjutkan"),
                        dismissButton: .default(Text("OK"))
                        
                    )
                }
            }
        }
    }
    
}

#Preview {
    SimplePage()
        .environmentObject(FormSimpleViewModel())
}
