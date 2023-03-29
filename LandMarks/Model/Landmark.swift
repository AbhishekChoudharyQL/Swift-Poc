//
//  Landmark.swift
//  LandMarks
//
//  Created by abhishek on 27/03/23.
//

import Foundation
import SwiftUI
import CoreLocation
 
struct Landmark: Hashable, Codable, Identifiable {
    //MARK: - Properties
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite : Bool
    var isFeatured : Bool
    var category : Category
    //MARK: - Enum
    enum Category : String,CaseIterable,Codable {
      case lake = "Lakes"    // category enumeration is done to select the category from available categories
      case river = "Rivers"
      case mountains = "Mountains"
    }
    // MARK: -Private Methods
    private var imageName: String
    var image: Image {
        Image(imageName)
    }

    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    //MARK: -Structure
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}


