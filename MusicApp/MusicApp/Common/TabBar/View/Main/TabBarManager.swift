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
    
    var body: some View {
        VStack(alignment: .center, content: {
            switch selectedTab {
            case .home:
                HomeView()
            case .heart:
                FavouriteView()
            case .magnifyingglass:
                SearchView()
            }
        })
        .overlay(alignment: .bottom ,content: {
            VStack(spacing: 0, content: {
                FloatingScreenView(audioPlayerViewModel: AudioPlayerViewModel())    
                TabBar(selectedTab: $selectedTab)
            })
        })
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

struct TabBarManager_Previews: PreviewProvider {
    static var previews: some View {
        TabBarManager()
    }
}
