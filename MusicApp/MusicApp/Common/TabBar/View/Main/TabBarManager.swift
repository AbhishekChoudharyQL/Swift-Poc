//
//  TabBarManager.swift
//  MusicApp
//
//  Created by abhishek on 04/04/23.
//

import SwiftUI

// Root View
struct TabBarManager: View {
    @State var selectedTab: TabItems = .home
    @StateObject var audioPlayerStateManager : AudioPlayerViewModel
    var body: some View {
        VStack(alignment: .center, content: {
            switch selectedTab {
            case .home:
                HomeView()
            case .heart:
                FavouriteView()
            case .magnifyingglass:
                SearchView( audioPlayerViewModel: audioPlayerStateManager)
            }
        })
        .overlay(alignment: .bottom ,content: {
            VStack(spacing: 0, content: {
                FloatingScreenView(audioPlayerViewModel: audioPlayerStateManager)
                TabBar(selectedTab: $selectedTab)
            })
        })
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

struct TabBarManager_Previews: PreviewProvider {
    static var audioPlayerViewManager = AudioPlayerViewModel()
    static var previews: some View {
        TabBarManager(audioPlayerStateManager: audioPlayerViewManager)
    }
}
