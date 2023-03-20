//
//  locationData.swift
//  weatherApi
//
//  Created by abhishek on 17/03/23.
//

import Foundation
import UIKit
//MARK: MODELS
struct WeatherData : Codable {
    var location : LocationData
    var current : CurrentData
}

struct LocationData : Codable {
    var name : String
    var country: String
}

struct CurrentData : Codable {
    var last_updated : String
    var temp_c : Float
    var wind_kph: Float
    var humidity : Int
}

