//
//  MusicApp.swift
//  MusicApp
//
//  Created by abhishek on 03/04/23.
//

import SwiftUI


enum UserSession {
    case userOnIntroScreen
    case userOnMainApp
}

@main
struct MusicApp: App {
//    var networking = Networking()
    
    @State var userSession : UserSession = .userOnIntroScreen
    
    var body: some Scene {
        WindowGroup {
            
            switch userSession {
            case .userOnIntroScreen:
                IntroScreensViews(userSession: $userSession)
            case .userOnMainApp:
                TabBarManager()
            }
            
//            HomeView()
//                .environmentObject(networking)
//           IntroScreensViews()
            //TabBarManager()
//            AudioPlayerView()
//            PlaylistApi()
        }
    }
}
