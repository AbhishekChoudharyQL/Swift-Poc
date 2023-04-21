//
//  SearchModel.swift
//  MusicApp
//
//  Created by abhishek on 17/04/23.
//

import Foundation

// MARK: - SearchResult
struct SearchResult: Codable {
    let data: [SearchData]
    let total: Int
    let next: String
}
//MARK: - SearchData 
struct SearchData: Codable, Identifiable {
    let id: Int
    let title, titleShort: String?
    let link: String?
    let duration, rank: Int?
    let explicitLyrics: Bool?
    let preview: String?
    let md5Image: String?
    let artist : SearchArtist
}

struct SearchArtist : Codable {
    let picture_medium : String
}
