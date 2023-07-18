//
//  CoinImageService.swift
//  SmartCrypto
//
//  Created by abhishek on 14/07/23.
//

import Foundation
import SwiftUI
import Combine

class CoinImageService {
    
    //MARK: - Properties
    @Published var coinImage: UIImage? = nil
    private var imageSubscription: AnyCancellable?
    private var coin: CoinModel
    
    init(coin: CoinModel) {
        self.coin = coin
        downloadCoinImage(urlString: coin.image)
    }
    
    //MARK: - Private Methods
    private func downloadCoinImage(urlString: String) {
        
        guard let url = URL(string: urlString) else {
            debugLog(logType: .optionalUnwrapFail)
            return
        }
        
        if let cachedImage =  CacheManager.instance.get(name: urlString) {
            coinImage = cachedImage
            return
        }
        
        
        imageSubscription = NetworkManager.download(url: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: { [weak self] completion in
                NetworkManager.handleCompletion(completion: completion)
                self?.imageSubscription?.cancel()
            }) { [weak self] image in
                self?.coinImage = image
                if let image = image {
                    CacheManager.instance.add(image: image, name: urlString)
                }
            }
    }
}
