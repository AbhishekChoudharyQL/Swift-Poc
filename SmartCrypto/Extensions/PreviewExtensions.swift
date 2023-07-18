//
//  PreviewExtensions.swift
//  SmartCrypto
//
//  Created by abhishek on 13/07/23.
//


import Foundation
import SwiftUI


///  - Returns :   For providing `previews throughout the app`
extension PreviewProvider {
    
    static var preview: SmartCryptoPreviews {
        return SmartCryptoPreviews.instance
    }
    
}

class SmartCryptoPreviews {
    
    static let instance = SmartCryptoPreviews()
    private init() { }
    
    let stat1 = StatisticalModel(title: "Market Cap", value: "₹984bn",percentageChanged: 25.34)
    let stat2 = StatisticalModel(title: "Total Volume", value: "₹1.23Tr")
    let homeViewModel = HomeViewModel()
    let coin = CoinModel(
       id: "bitcoin",
       symbol: "btc",
       name: "Bitcoin",
       image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
       currentPrice: 61408,
       marketCap: 1141731099010,
       marketCapRank: 1,
       fullyDilutedValuation: 1285385611303,
       totalVolume: 67190952980,
       high24H: 61712,
       low24H: 56220,
       priceChange24H: 3952.64,
       priceChangePercentage24H: 6.87944,
       marketCapChange24H: 72110681879,
       marketCapChangePercentage24H: 6.74171,
       circulatingSupply: 18653043,
       totalSupply: 21000000,
       maxSupply: 21000000,
       ath: 61712,
       athChangePercentage: -0.97589,
       athDate: "2021-03-13T20:49:26.606Z",
       atl: 67.81,
       atlChangePercentage: 90020.24075,
       atlDate: "2013-07-06T00:00:00.000Z",
       lastUpdated: "2021-03-13T23:18:10.268Z",
       sparklineIn7D: SparklineIn7D(price: [
           54019.26878317463,
           53718.060935791524,
       ]),
       priceChangePercentage24HInCurrency: 3952.64,
       currentHoldings: 1.5)
    
}

