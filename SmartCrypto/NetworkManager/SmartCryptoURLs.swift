//
//  SmartCryptoURLs.swift
//  SmartCrypto
//
//  Created by abhishek on 18/07/23.
//

import Foundation

class SmartCryptoUrl {
    
    static let shared = SmartCryptoUrl()
    let baseUrl = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h"
    let marketDataUrl = "https://api.coingecko.com/api/v3/global"
}
