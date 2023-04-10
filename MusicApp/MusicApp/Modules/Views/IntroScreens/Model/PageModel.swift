//
//  PageModel.swift
//  MusicApp
//
//  Created by abhishek on 07/04/23.
//

import Foundation

struct Page : Identifiable,Equatable {
    let id = UUID()
    var title : String
    var description : String
    var imageUrl : String
    var tag : Int
    static var samplePage = Page(title: "sample1", description: "Sample-Description", imageUrl: "Enjoy-your-music", tag: 0)
    
    
    static var samplePages = [Page(title: "Welcome to onbeats App", description: "Experience the ultimate music journey with onbeats", imageUrl: "Enjoy-your-music", tag: 0),Page(title: "No Advertisements", description: "Unleash your inner music lover with ad-free music" , imageUrl: "No-advertisement", tag: 1)]
    
    
}
