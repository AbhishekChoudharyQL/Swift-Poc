//
//  SmartCryptoApp.swift
//  SmartCrypto
//
//  Created by abhishek on 12/07/23.
//

import SwiftUI

@main
struct SmartCryptoApp: App {
    
    @StateObject private var homeViewModel = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                HomeView()
                    .navigationBarHidden(true)
            }.environmentObject(homeViewModel)
        }
    }
}
