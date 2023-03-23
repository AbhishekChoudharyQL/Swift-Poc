//
//  PokemonModel.swift
//  PokemonFetchApp
//
//  Created by abhishek on 20/03/23.
//

import Foundation
import UIKit
  
//var fetchedUrl : String = ""
//var pokemonData : [PokemonData] = []

struct PokemonListResponse: Codable {
    let results: [Pokemon]
}

struct Pokemon: Codable {
    let name: String?
    let url: String

    enum CodingKeys: String, CodingKey {
        case name, url
    }
}

struct PokemonData : Codable {
    var id: Int
    var sprites: Sprites // needs to be extracted from sprites
    var height: Int
    var weight: Int
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case sprites
        case height
        case weight
        case name
    }
}

struct Sprites : Codable {
    let front_default : String?
    let other : OfficialArtwork?
}

struct OfficialArtwork: Codable {
    let officialArtwork: FrontDefault?
    
    enum CodingKeys: String, CodingKey {
        case officialArtwork = "official-artwork"
    }
}

struct FrontDefault: Codable {
    let front_default: String
}

// var name : String
 
