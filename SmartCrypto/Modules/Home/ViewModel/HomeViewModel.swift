//
//  HomeViewModel.swift
//  SmartCrypto
//
//  Created by abhishek on 13/07/23.
//

import Foundation

class HomeViewModel : ObservableObject {
    
    @Published var allCoins : [CoinModel] = []
    @Published var portfolioCoins : [CoinModel] = []
    
    init() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            self.allCoins.append(SmartCryptoPreviews.instance.coin)
            self.portfolioCoins.append(SmartCryptoPreviews.instance.coin)
        }
    }
}
