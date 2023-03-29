//
//  ModelData.swift
//  LandMarks
//
//  Created by abhishek on 27/03/23.
//

import Foundation
import SwiftUI

//MARK: - ObservableClass
final class ModelData : ObservableObject {           // final class ??
    @Published var landmarks: [Landmark] = loadLandmarksArray("landmarkData.json")
    var featured : [Landmark] {
        landmarks.filter {
            $0.isFeatured
        }
    }
    var categories : [String:[Landmark]]{
        Dictionary(grouping: landmarks, by: {
            $0.category.rawValue
        })
    }
}
//
    //MARK: - Public Methods
func loadLandmarksArray<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}



