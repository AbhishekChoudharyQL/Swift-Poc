//
//  TabBarManager.swift
//  StockApp
//
//  Created by abhishek on 27/04/23.
//

import SwiftUI

struct TabBarManager: View {
    @State var selectedTab : TabItems
    var body: some View {
        VStack(content: {
            switch selectedTab {
            case .bookmark:
                BookmarkList()
            case .stocks :
                StocksView()
            }
        })
        VStack {
            Spacer()
         CustomTabBar(selectedTab: $selectedTab)
        }
        
    }
}

struct TabBarManager_Previews: PreviewProvider {
    static var previews: some View {
        TabBarManager(selectedTab: .stocks)
    }
}
