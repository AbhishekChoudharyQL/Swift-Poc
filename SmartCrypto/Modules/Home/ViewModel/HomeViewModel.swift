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
    @Published var allCoins : [CoinModel] = []
    @Published var portfolioCoins : [CoinModel] = []
    private let dataService = CoinDataService()
    private let cancelleables = Set<AnyCancellable>()
    
    init() {
       addSubscriber()
    }
    
    //MARK: - Private Methods
    private func addSubscriber() {
        
    }
}
