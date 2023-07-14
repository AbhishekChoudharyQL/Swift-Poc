//
//  CoinDataService.swift
//  SmartCrypto
//
//  Created by abhishek on 14/07/23.
//

import Foundation
import  Combine

class CoinDataService {
    
    //MARK: - Properties
    @Published var allCoins : [CoinModel] = []
    var coinSubscriptions : AnyCancellable?
    
    init() {
        getCoins()
    }
    
    //MARK: - Private Methods
    private func getCoins() {
        
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h") else {
            debugLog(logType: .optionalUnwrapFail)
            return
        }
        coinSubscriptions = NetworkManager.download(url: url)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: {[weak self] recievedCoins in
                self?.allCoins = recievedCoins
                self?.coinSubscriptions?.cancel()
            })
    }
}
