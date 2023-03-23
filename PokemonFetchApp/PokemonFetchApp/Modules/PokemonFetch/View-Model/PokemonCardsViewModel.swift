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
        NetworkManager.shared.serviceRequest(endPoint: .pokemonListing,listingCount: 500) { data, response, error in
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

        // get pokemondata for each pokemon
        for pokemon in pokemonList {
            // URl
            let pokemonId = pokemon.url.replacingOccurrences(of: "https://pokeapi.co/api/v2/pokemon", with: "")

            // Method call
            NetworkManager.shared.serviceRequest(endPoint: .pokemonData, pokemonID: pokemonId) { data, response, error in
                guard let data = data else {print("Failed to extract data"); return }

                do {
                    let jsonresposne = try JSONDecoder().decode(PokemonData.self, from: data)
                    debugPrint(jsonresposne)
                    allPokemons.append(jsonresposne)

                    if pokemonList.count == allPokemons.count {
                        pokemonData(allPokemons)
                    }
                } catch let error  {
                    print("cathing error: \(error)")
                }
            }
        }
    }
}
