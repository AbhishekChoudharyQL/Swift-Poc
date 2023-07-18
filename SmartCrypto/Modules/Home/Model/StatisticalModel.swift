//
//  StatisticalModel.swift
//  SmartCrypto
//
//  Created by abhishek on 17/07/23.
//

import Foundation

struct StatisticalModel : Identifiable{
    
    let id = UUID().uuidString
    let title : String
    let value : String
    let percentageChanged : Double?
    
    init(title: String, value: String, percentageChanged: Double? = nil) {
        self.title = title
        self.value = value
        self.percentageChanged = percentageChanged
    }
    
}
