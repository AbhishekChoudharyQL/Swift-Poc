//
//  playlistModel.swift
//  MusicApp
//
//  Created by abhishek on 11/04/23.
//

import Foundation

struct PlaylistResponse: Codable ,Equatable,Hashable{
    var data: [PlaylistCollectionViewData]?
}
struct PlaylistCollectionViewData: Codable ,Equatable,Hashable {
    var id: Int?
    var title: String?
    var picture: String?
    var user: User?
}
struct User: Codable ,Equatable,Hashable {
    var tracklist: String?
}
