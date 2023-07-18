//
//  Double.swift
//  SmartCrypto
//
//  Created by abhishek on 13/07/23.
//

import Foundation

extension Double {
    
    ///  Converrts a double into a Currency  with 2 decimal places
    private var currencyFormatter2 : NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = .current        //  <- this gives us default value  i.e USD
        formatter.currencyCode = "INR"     //  <- change currency here
        formatter.currencySymbol = "₹"     //  <- change currency symbol
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        
        return formatter
    }
    
    ///  Converts Double into currency as a string with 2 decimal places
    /// ```
    ///   Converts 1234.56 "₹ 1,234.56"
    ///```
    func asCurrencyWith2Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter2.string(from: number) ?? "₹ 0.0"
    }
    
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
    
    /// Converts `1234`to `1.23k`
    func formatWithAbbreviation() -> String{
        
        let trillion = self / 1_000_000_000_000
        let billion = self / 1_000_000_000
        let million = self / 1_000_000
        let thousand = self / 1000
        
        if trillion >= 1.0 {
            return  (trillion*10 / 10).asNumberString() + "Tr"
        }
        else if billion >= 1.0 {
            return   (billion * 10 / 10).asNumberString() + "B"
        } else if million >= 1.0 {
            return  (million*10 / 10).asNumberString() + "M"
        } else if thousand >= 1.0 {
            return (thousand*10 / 10).asNumberString() + "K"
        } else {
            return "\(self)"
        }
    }
}
