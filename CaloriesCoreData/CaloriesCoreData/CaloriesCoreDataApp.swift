//
//  CaloriesCoreDataApp.swift
//  CaloriesCoreData
//
//  Created by abhishek on 26/04/23.
//

import SwiftUI

@main
struct CaloriesCoreDataApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            HomeView()
//            AddFoodView()
            //MARK: - injecting the database
                .environment(\.managedObjectContext,dataController.container.viewContext)
            // this will help us to use this context throughout the app
        }
    }
}
