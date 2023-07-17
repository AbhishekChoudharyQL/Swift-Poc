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
    @Published var statistics : [MarketStatisticalModel] = [MarketStatisticalModel(title: "Title1", value: "Value 1",percentageChange: 1), MarketStatisticalModel(title: "Title1", value: "Value 2"),
       MarketStatisticalModel(title: "Title3", value: "Value3"), MarketStatisticalModel(title: "Title4", value: "Value4",percentageChange: -7)
    ]
    @Published var allCoins : [CoinModel] = []
    @Published var portfolioCoins : [CoinModel] = []
    @Published var searchText : String = ""
    private let dataService = CoinDataService()
    private var cancelleables = Set<AnyCancellable>()
    
    init() {
        addSubscriber()
    }
    
    //MARK: - Private Methods
    private func addSubscriber() {
        $searchText
        /// here we combine `searchText` publisher with `allCoins` publisher
            .combineLatest(dataService.$allCoins)
            .debounce(for: 0.5, scheduler: DispatchQueue.main)
        /// this map will take  input string  , and starting coin as parameter and perform filtering and return the filtered results
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
    }
}
