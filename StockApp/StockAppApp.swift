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
    var body: some Scene {
        WindowGroup {
            HomeView()
                //MARK: - injecting into database
                .environment(\.managedObjectContext, bookmarkDataModel.container.viewContext)
        }
    }
}
