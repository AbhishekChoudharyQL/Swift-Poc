//
//  Double.swift
//  SmartCrypto
//
//  Created by abhishek on 13/07/23.
//

import Foundation

extension Double {
    
    ///  Converrts a double into a Currency  with 2-6 decimal places
    private var currencyFormatter6 : NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = .current        //  <- this gives us default value  i.e USD
        formatter.currencyCode = "INR"     //  <- change currency here
        formatter.currencySymbol = "₹"     //  <- change currency symbol
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        
        return formatter
    }
    
    ///  Converts Double into currency as a string with 2-6 decimal places 
    /// ```
    ///   Converts 1234.56 "₹ 1,234.56"
    ///```
    func asCurrencyWith6Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter6.string(from: number) ?? "₹ 0.0"
    }
    
    /// Converts  Double into string representation
    ///```
    ///   Converts 1.2345 to "1.23"
    ///```
    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }
    
    /// Converts String into string representation with % symbol
    func asPercentageString() -> String {
        return asNumberString() + "%"
    }

}
