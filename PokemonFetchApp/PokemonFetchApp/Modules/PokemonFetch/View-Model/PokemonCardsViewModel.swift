//
//  PokemonCardsViewModel.swift
//  PokemonFetchApp
//
//  Created by abhishek on 23/03/23.
//

import Foundation

class PokemonCardsViewModel {
    
    //MARK: - Public methods
    public func getPokemonData(pokemonData: @escaping ([PokemonData]) -> ()) {
        // right approach
        NetworkManager.shared.serviceRequest(endPoint: .pokemonListing,listingCount: 5) { data, response, error in
            do {
                //let decodedResponse  = try JSONDecoder().decode(PokemonListResponse.self, from: data!)
                let decodedResponse  = try JSONDecoder().decode(PokemonListResponse.self, from: data!)
                let pokemonArray = decodedResponse.results
                
                print(pokemonArray)
                self.getPokemonDataFromPokemonListing(pokemonList: pokemonArray) { resolvedPokemonData in
                    pokemonData(resolvedPokemonData)
                }
                
            } catch(let decodingListApiDataError) {
                print(decodingListApiDataError)
            }
        }
    }
    
    //MARK: - private methods
    private func getPokemonDataFromPokemonListing(pokemonList: [Pokemon], pokemonData: @escaping ([PokemonData]) -> ()) {
        //create a container to store data
        var allPokemons : [PokemonData] = []
        
        let group = DispatchGroup()
        
        let queue = DispatchQueue(label: "pokemonDataStore", qos: .default, attributes: .initiallyInactive, autoreleaseFrequency: .never, target: nil)
        
        group.enter()
        queue.async(group: group, execute: {
            // get pokemondata for each pokemon
            for pokemon in pokemonList {
                let pokemonId = pokemon.url.replacingOccurrences(of: "https://pokeapi.co/api/v2/pokemon", with: "")
                print(pokemonId)
                
                NetworkManager.shared.serviceRequest(endPoint: .pokemonData, pokemonID: pokemonId) { data, response, error in
                    guard let data = data else {print("Failed to extract data"); return }
                    
                    do {
                        let jsonresposne = try JSONDecoder().decode(PokemonData.self, from: data)
                        allPokemons.append(jsonresposne)
                    } catch let error  {
                        print("cathing error: \(error)")
                    }
                }
            }
            
            // return that data to parent methods
            pokemonData(allPokemons)
            group.leave()
        })
    }
}
