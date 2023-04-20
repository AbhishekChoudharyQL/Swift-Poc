//
//  ArtistModel.swift
//  MusicApp
//
//  Created by abhishek on 11/04/23.
//

import Foundation

struct Artist : Codable,Identifiable {
    var id : Int?
    var name : String?
    var picture_medium : String?
    var tracklist : String?
}

