//
//  StocksModel.swift
//  StockApp
//
//  Created by abhishek on 27/04/23.
//

import Foundation

//MARK: - Model for stocks
struct StocksModel : Codable {
    var stocks : [Stocks]
}

struct Stocks : Codable {
    var name : String?
    var current_price : Double?
    var highest_price : Double?
    var values : [Double]
    var isBookmarked: Bool?
}
