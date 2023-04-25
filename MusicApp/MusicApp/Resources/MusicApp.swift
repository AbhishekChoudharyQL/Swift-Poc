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
    //MARK: - Properties
    @State var userSession : UserSession = .userOnIntroScreen
    @StateObject var audioPlayerManager = AudioPlayerViewModel()


    //MARK: - View Builder
    var body: some Scene {
        WindowGroup {
//            switch userSession {
//            case .userOnIntroScreen:
//                OnboardingView(userSession: $userSession)
//            case .userOnMainApp:
//                TabBarManager()
//            }
//            SearchView()
            TabBarManager( audioPlayerStateManager: audioPlayerManager )
//            PlaylistCollectionView(playlistData: $playlistData)
           
        }
    }
}
