//
//  UIApplication.swift
//  SmartCrypto
//
//  Created by abhishek on 17/07/23.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing(){
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}
