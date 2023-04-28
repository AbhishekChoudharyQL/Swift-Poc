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
        VStack {
            switch selectedTab {
            case .bookmark:
                BookmarkList()
            case .stocks :
                StocksView()
            }
            Spacer().frame(height: 0)
            CustomTabBar(selectedTab: $selectedTab)
                .ignoresSafeArea()
        }
    }
    
}


struct TabBarManager_Previews: PreviewProvider {
    static var previews: some View {
        TabBarManager(selectedTab: .stocks)
    }
}
