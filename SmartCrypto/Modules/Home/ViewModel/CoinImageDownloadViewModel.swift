//
//  CoinImageDownloadViewModel.swift
//  SmartCrypto
//
//  Created by abhishek on 14/07/23.
//

import Foundation
import SwiftUI
import Combine



class CoinImageDownloadViewModel : ObservableObject {

    //MARK: - Properties
    @Published var coinImage : UIImage? = nil
    @Published var isLoading : Bool = false
    private var dataService :CoinImageService
    private var coin : CoinModel
    private var cancelleable = Set<AnyCancellable>()

    init(coin : CoinModel){
        self.coin = coin
        dataService = CoinImageService(coin: coin)
        self.isLoading = true
        addSubscriber()
    }

    //MARK: - Private Methods
    private func addSubscriber(){

        dataService.$coinImage
            .sink {[weak self]  _ in
                self?.isLoading = false
            }
    receiveValue: { [weak self] recievedImage in
                self?.coinImage = recievedImage

            }
            .store(in: &cancelleable)
    }
}



