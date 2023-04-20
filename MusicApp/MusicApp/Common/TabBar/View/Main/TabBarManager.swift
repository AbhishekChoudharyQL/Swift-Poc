//
//  TabBarManager.swift
//  MusicApp
//
//  Created by abhishek on 04/04/23.
//

import SwiftUI


//MARK: - Root View
struct TabBarManager: View {
    //MARK: - Properties
    @State var selectedTab: TabItems = .home
    
    //MARK: - View Builder
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
                FloatingScreenView()    
                TabBar(selectedTab: $selectedTab)
            })
        })
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

//MARK: - Previews
struct TabBarManager_Previews: PreviewProvider {
    static var previews: some View {
        TabBarManager()
    }
}
