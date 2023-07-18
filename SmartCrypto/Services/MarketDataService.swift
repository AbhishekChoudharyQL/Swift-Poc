//
//  MarketDataService.swift
//  SmartCrypto
//
//  Created by abhishek on 17/07/23.
//

import Foundation
import SwiftUI
import Combine





class MarketDataService {
   
    @Published var marketData : DataClass? = nil
    private var marketDataSubscription : AnyCancellable?
    init() {
        getMarketData()
    }
    
    //MARK: - Private Methods
    private func getMarketData() {
        
        guard let url = URL(string: SmartCryptoUrl.shared.marketDataUrl) else {
            debugLog(logType: .optionalUnwrapFail)
            return
        }
        marketDataSubscription = NetworkManager.download(url: url)
            .decode(type: MarketStatisticalModel.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: {[weak self] recievedMarketData in
                self?.marketData = recievedMarketData.data
                self?.marketDataSubscription?.cancel()
            })
    }
}
    


