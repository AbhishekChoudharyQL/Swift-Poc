//
//  StockAppApp.swift
//  StockApp
//
//  Created by abhishek on 27/04/23.
//

import SwiftUI

@main
struct StockAppApp: App {
    @StateObject private var bookmarkDataModel = BookmarkDataModel()
    @StateObject var launchScreenState = LaunchScreenStateManager()
    var body: some Scene {
        WindowGroup {
            ZStack(content: {
                HomeView()
                    //MARK: - injecting into database
                    .environment(\.managedObjectContext, bookmarkDataModel.container.viewContext)
                if launchScreenState.state != .finished {
                                   LaunchScreenView()
                               }
            }).environmentObject(launchScreenState)
         
        }
    }
}
