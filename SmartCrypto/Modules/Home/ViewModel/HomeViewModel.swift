//
//  HomeViewModel.swift
//  SmartCrypto
//
//  Created by abhishek on 13/07/23.
//

import Foundation
import Combine

class HomeViewModel : ObservableObject {
    
    //MARK: - Properties
    @Published var statistics : [StatisticalModel] = []
    @Published var marketStatistics : DataClass?
    @Published var allCoins : [CoinModel] = []
    @Published var portfolioCoins : [CoinModel] = []
    @Published var searchText : String = ""
    private let coinDataService = CoinDataService()
    private let marketDataService = MarketDataService()
    private var cancelleables = Set<AnyCancellable>()
    
    init() {
        addSubscriber()
    }
    
    //MARK: - Private Methods
    private func addSubscriber() {
        $searchText
        /// here we combine `searchText` publisher with `allCoins` publisher
            .combineLatest(coinDataService.$allCoins)
            .debounce(for: 0.5, scheduler: DispatchQueue.main)
        /// this map will take  `input string, and starting coin as parameter` and perform filtering and `return the filtered results`
        ///   use of this map funciton is optional we could have done filtering in .sink method where we finally recieve value from publisher , but it is good parctice.
            .map { (text , startingCoins) -> [CoinModel] in
                guard !text.isEmpty  else {
                    return startingCoins
                }
                let lowercaseText = text.lowercased()
                
                return startingCoins.filter { (coin) -> Bool in
                    return coin.name.lowercased().contains(lowercaseText) ||
                    coin.symbol.lowercased().contains(lowercaseText) ||
                    coin.id.lowercased().contains(lowercaseText)
                }
            }
            .sink { [weak self] receivedCoins in
                self?.allCoins = receivedCoins
            }
            .store(in: &cancelleables)
          
        // updating market data here ....
        marketDataService.$marketData
            .map(mapGlobalMarketData)
            .sink { [weak self] (recievedStats) in
                self?.statistics = recievedStats
            }
            .store(in: &cancelleables)

    }
    
    private func mapGlobalMarketData(marketDataModel : DataClass?) -> [StatisticalModel]{
        var stats : [StatisticalModel] = []
        guard let data = marketDataModel else {return stats}
        let marketCap = StatisticalModel(title: "MarketCap", value: data.marketCap , percentageChanged: data.marketCapChangePercentage24HUsd)
        let volume = StatisticalModel(title: "24h Volume", value: data.volume)
        let btcDominance = StatisticalModel(title: "BTC Dominance", value: data.btcDominance)
        let porfolio = StatisticalModel(title: "PortFolio Value", value: "$0.0", percentageChanged: 0)
        stats.append(contentsOf:[
        marketCap,volume,btcDominance,porfolio])
        return stats
    }
}
