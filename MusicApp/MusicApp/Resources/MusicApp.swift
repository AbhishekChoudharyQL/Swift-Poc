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
//    @State var playlistData : [PlaylistResponse] = [PlaylistResponse(data: [Data(id: 0, title: "Songs", picture: "Sing", user: nil),
//                                                                Data(id: 0, title: "Songs", picture: "Sing", user: nil),
//                                                                Data(id: 0, title: "Songs", picture: "Sing", user: nil),
//                                                                Data(id: 0, title: "Songs", picture: "Sing", user: nil),
//                                                                Data(id: 0, title: "Songs", picture: "Sing", user: nil),
//                                                                Data(id: 0, title: "Songs", picture: "Sing", user: nil)])]

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
            TabBarManager()
//            PlaylistCollectionView(playlistData: $playlistData)
        }
    }
}
