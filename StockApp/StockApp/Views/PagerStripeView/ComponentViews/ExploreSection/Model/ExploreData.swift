//
//  ExploreData.swift
//  StockApp
//
//  Created by abhishek on 28/04/23.
//

import Foundation

struct ExploreData : Codable {
    
    var image : String
    var title : String
    var currentValue : Double
    var changedStatus : String
    var isNegative : Bool
}
var exploreData : [ExploreData] = [ExploreData(image: "irfcloog", title: "IRFC", currentValue: 31.90, changedStatus:                                  "0.45(1.43%)", isNegative: false),
                                   ExploreData(image: "RailVikasNigam", title: "Rail Vikas Nigam", currentValue: 107.60, changedStatus: "4.40(4.26%)", isNegative: false),
                                   ExploreData(image: "Zomato_Logo", title: "Zomato", currentValue: 60.15, changedStatus: "0.55(0.91%)", isNegative: true),
                                   ExploreData(image: "nykaalogo", title: "Nykaa", currentValue: 120.45, changedStatus: "4.50(3.88%)", isNegative: false)
                                        ]
