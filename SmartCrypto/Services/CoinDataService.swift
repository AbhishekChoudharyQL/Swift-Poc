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
        
     coinSubscriptions = URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap({ (output) -> Data in
                guard let response = output.response as? HTTPURLResponse , response.statusCode >= 200 &&
                        response.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
                return output.data
            })
            .receive(on: DispatchQueue.main)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink { completion in
                switch completion {
                    
                case .finished:
                    break
                case .failure(let error):
                    debugLog(logType: .error , anyObject: error.localizedDescription)
                }
            } receiveValue: {[weak self] recievedCoins in
                self?.allCoins = recievedCoins
                self?.coinSubscriptions?.cancel()
            }
            
    }
    
}
