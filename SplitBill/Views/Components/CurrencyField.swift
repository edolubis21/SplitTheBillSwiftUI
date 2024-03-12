//
//  CurrencyField.swift
//  HiungBagiUang
//
//  Created by edo lubis on 24/02/24.
//

import SwiftUI
import Combine

struct CurrencyTextField: View {
    
    let currencyFormatter = CurrencyFormatter()
    let title: String
    @Binding var text: String
    
    init(_ title: String, text: Binding<String>) {
        self.title = title
        self._text = text
    }
    
    var body: some View {
        TextField(title, text: $text)
            .keyboardType(.numberPad)
            .textFieldStyle(.roundedBorder)
            .onReceive(Just(text)) { newValue in
                     let filtered = newValue.filter { "0123456789.".contains($0) }
                     if filtered != newValue {
                         self.text = filtered
                     }
                 }
            .onChange(of: text) { newValue in
                let valueFormatted = moneyFormatter( newValue)
                if valueFormatted != text {
                    text = valueFormatted
                }
            }
    }
    
    func moneyFormatter(_ value: String) -> String {
        let numberString = currencyFormatter.currencyToNumberString(value)
        let result = currencyFormatter.numberStringToCurrency(numberString)
        return result
    }
}

#Preview {
 @State var text: String = ""
  return  CurrencyTextField("Hello", text: $text)
}
