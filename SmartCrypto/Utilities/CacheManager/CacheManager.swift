//
//  CacheManager.swift
//  SmartCrypto
//
//  Created by abhishek on 18/07/23.
//

import Foundation
import SwiftUI


/// - `Responsible for` :
///  1)  `Saving` images to cache memory
///  2)  `Retreiving` cache images to display
///  3) `Delete` or remove cache images
class CacheManager {
    
    //MARK: - Properties
    static let instance = CacheManager()
    private init() {}
    
    var imageCache : NSCache<NSString, UIImage> = {
        let cache = NSCache<NSString , UIImage>()
        cache.countLimit = 100
        cache.totalCostLimit = 1024*1024*100
        return cache
    }()
    
    //MARK: - Public Methods
    func add(image : UIImage, name : String){
        imageCache.setObject(image, forKey: name as NSString)
        debugLog(logType: .info , anyObject: imageCache , text: "Adding image to cache")
    }
    
    func remove(name : String){
        imageCache.removeObject(forKey: name as NSString)
        debugLog(logType: .info , text: "Removing from cache")
    }
    
    func get(name : String) -> UIImage? {
        debugLog(logType: .info , anyObject: name , text: "getting image from cache")
        return imageCache.object(forKey: name as NSString)
        
    }
    
}
