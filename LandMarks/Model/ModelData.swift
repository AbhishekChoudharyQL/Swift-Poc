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
class UserSetting : ObservableObject {
    @Published var fisrtNameRegister : String {
        didSet{
            UserDefaults.standard.set(fisrtNameRegister, forKey: "fisrtNameRegister")
        }
        
    }
    @Published var lastNameRegister : String {
        didSet{
            UserDefaults.standard.set(lastNameRegister, forKey: "lastNameRegister")
        }
    }
    @Published var emailRegister : String {
        didSet{
            UserDefaults.standard.set(emailRegister, forKey: "emailRegister")
        }
    }
    @Published var passwordRegister : String {
        didSet{
            UserDefaults.standard.set(passwordRegister, forKey: "passwordRegister")
        }
    }
    init() {
        self.fisrtNameRegister = UserDefaults.standard.object(forKey: "fisrtNameRegister") as! String
        self.lastNameRegister = UserDefaults.standard.object(forKey: "lastNameRegister") as! String
        self.emailRegister = UserDefaults.standard.object(forKey: "emailRegister") as! String
        self.passwordRegister = UserDefaults.standard.object(forKey: "passwordRegister") as! String
    }
}


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



