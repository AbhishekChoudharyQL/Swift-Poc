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
    @Published var coinImage : UIImage? = nil
    private var imageSubscription : AnyCancellable?
    
    init(urlString : String) {
        getCoinImage(urlString: urlString)
    }
    
    //MARK: - Private Methods
    private func getCoinImage(urlString : String){
        
        guard let url = URL(string: urlString) else {
            debugLog(logType: .optionalUnwrapFail)
            return
        }
        imageSubscription = NetworkManager.download(url: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] image in
                self?.coinImage = image
                self?.imageSubscription?.cancel()
            })
    }
}
