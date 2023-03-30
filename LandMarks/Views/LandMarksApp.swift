//
//  LandMarksApp.swift
//  LandMarks
//
//  Created by abhishek on 24/03/23.
//

import SwiftUI

@main
struct LandMarksApp: App {
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
//            ContentView()
            SplashView()
                .environmentObject(ModelData())
        }
    }
}

