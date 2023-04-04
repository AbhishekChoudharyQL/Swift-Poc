//
//  TabBarManager.swift
//  MusicApp
//
//  Created by abhishek on 04/04/23.
//

import SwiftUI

// Root View
struct TabBarManager: View {
    @State var selectedTab: TabItems = .music
    
    var body: some View {
        VStack(alignment: .center, content: {
            switch selectedTab {
            case .music:
                HomeView()
            case .heart:
                FavouriteView()
            case .magnifyingglass:
                SearchView()
            }
        })
        .frame(height: UIScreen.main.bounds.height)
        .background(Color.red)
        .overlay(alignment: .bottom ,content: {
            TabBar(selectedTab: $selectedTab)
        })
    }
}

struct TabBarManager_Previews: PreviewProvider {
    static var previews: some View {
        TabBarManager()
    }
}
