//
//  NetworkManager.swift
//  SmartCrypto
//
//  Created by abhishek on 14/07/23.
//

import Foundation
import Combine
import SwiftUI

class NetworkManager {
    
   
    
    enum NetworkingError : LocalizedError {
        case badURLResponse(url : URL)
        case unknown
        
        var errorDescription : String? {
            switch self {
            case .badURLResponse(url : let url):
                return "[🔥] Bad reponse from url \(url)"
            case .unknown:
                return "[⚠️] unknown error occured"
            }
        }
    }
    
    
    /// - `Responsible` :  `Generic network latyer responsible for making network request using publishers`
    ///  - Parameter :  Takes `url` to perform `datatask`
    ///  - Returns :  `AnyPublisher<Data,Error>`
    
    static func download(url : URL) -> AnyPublisher<Data, Error> {

        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap({ (output) -> Data in
                guard let response = output.response as? HTTPURLResponse , response.statusCode >= 200 &&
                        response.statusCode < 300 else {
                    throw NetworkingError.badURLResponse(url: url)
                }
                print("Downloading images here")
                return output.data
            })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()    /// will take the current `publisher` and convert it  into  `AnyPublisher<Data,Error>`
        /// here it will take current publisher
    }
 

    
    
    static func handleCompletion(completion : Subscribers.Completion<Error>){
        switch completion {
        case .finished:
            break
        case .failure(let error):
            debugLog(logType: .error , anyObject: error.localizedDescription)
        }
    }
}

