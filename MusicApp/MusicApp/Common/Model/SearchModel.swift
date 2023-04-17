//
//  SearchModel.swift
//  MusicApp
//
//  Created by abhishek on 17/04/23.
//

import Foundation

struct SearchModel : Codable , Identifiable {
    var id : String?
    var  title_short : String?
    var preview : String?
}
