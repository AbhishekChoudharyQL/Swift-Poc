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
            case .music:
                FloatingScreenView()
            case .heart:
                FavouriteView()
            case .magnifyingglass:
                SearchView()
           
            }
        })
        .frame(height: UIScreen.main.bounds.height)
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
