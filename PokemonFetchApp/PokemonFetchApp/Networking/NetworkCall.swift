//
//  NetworkCall.swift
//  PokemonFetchApp
//
//  Created by abhishek on 23/03/23.
//

import Foundation

enum EndpointsProvider : String {
    case pokemonListing = "pokemon?limit=" /// needs limit after `=` in numeric format, i.e. 10, 20, 50 etc...
    case pokemonData = "pokemon"
}

class APIURL {
    // https://pokeapi.co/api/v2/pokemon/5/
    static let baseURL = "https://pokeapi.co/api/v2/" // Prod enviornment
}

class NetworkManager {
    //MARK: - Singleton
    static let shared = NetworkManager()
    private init() {}
    
    //MARK: - Properties
    let baseURL = APIURL.baseURL
    
    
    //MARK: - Public methods
    func serviceRequest(endPoint: EndpointsProvider, listingCount: Int = 20, pokemonID: String? = nil, completion : @escaping (Data?, URLResponse?, Error?) -> Void) {
        
        var urlString = baseURL + endPoint.rawValue
        
        // check for adding limit at the end of url
        if endPoint == .pokemonListing {
            urlString = baseURL + endPoint.rawValue + "\(listingCount)"
        }
        
        // IF asking for pokemonData
        if endPoint == .pokemonData {
            if let pokemonID = pokemonID {
                urlString = baseURL + endPoint.rawValue + pokemonID
            } else {
                print("Pokemon id not provided")
            }
            
        }
        
        guard let url = URL(string: urlString) else {return}
        
//        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=20") else {return}
        URLSession.shared.dataTask(with: url) {
            data , response , error in
            
            completion(data, response, error)
        }.resume()
    }
    
    func fetchOtherData(){
        
    }
}


