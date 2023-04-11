//
//  playlistModel.swift
//  MusicApp
//
//  Created by abhishek on 11/04/23.
//

import Foundation

struct Playlist : Codable,Identifiable {
    var id : Int
    var title : String
    var picture_medium : String
    var tracks : Tracks
}
struct Tracks : Codable {
    var data : [Data]
}
struct Data : Codable,Identifiable {
    var id : Int
    var title_short: String
    var preview : String
}
