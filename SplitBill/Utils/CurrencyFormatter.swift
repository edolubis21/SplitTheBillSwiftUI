//
//  CurrencyFormatter.swift
//  HiungBagiUang
//
//  Created by edo lubis on 24/02/24.
//

import Foundation
import SwiftUI

class CurrencyFormatter {
    
    func numberStringToCurrency(_ value: String) -> String {
        var newValue = value
        var isMinus = false
        if newValue.first == "-" {
            isMinus = true
            newValue.remove(at: newValue.startIndex)
        }
        
        let splitAngka = newValue.split(separator: ",")
        if splitAngka.isEmpty {
            return ""
        }
        if splitAngka[0].isEmpty {
            return ""
        }
        let data = splitAngka[0].map { String($0) }
        let reversed = Array(data.reversed())
        var output = [String]()

        for (i, char) in reversed.enumerated() {
            if i % 3 == 0 && i != 0 {
                output.append(".")
            }
            output.append(char)
        }
        
        if isMinus {
            output.append("-")
        }

        if splitAngka.count > 1 {
            return output.reversed().joined() + ",\(splitAngka[1])"
        }

        return output.reversed().joined()
    }
    
    func numberToCurrency(_ value: Double) -> String {
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.maximumFractionDigits = 3
        
        let formattedString = numberFormatter.string(from: NSNumber(value: value)) ?? ""
        return numberStringToCurrency(currencyToNumberString(formattedString) )
    }
    
    func currencyToNumberString(_ value: String) -> String {
        let result = value.replacingOccurrences(of: ".", with: "")
        return result
    }
    
}
