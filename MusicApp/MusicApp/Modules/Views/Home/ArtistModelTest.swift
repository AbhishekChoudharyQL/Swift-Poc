//
//  ArtistModelTest.swift
//  MusicApp
//
//  Created by abhishek on 10/04/23.
//

import Foundation

struct Artist : Codable,Identifiable {
    var id : Int
    var name : String
    var picture_medium : String
}
