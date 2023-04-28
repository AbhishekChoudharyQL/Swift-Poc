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
            Spacer()
            CustomTabBar(selectedTab: $selectedTab)
                .ignoresSafeArea()
        }
//        .background(Color.cyan)
    }
    
}


struct TabBarManager_Previews: PreviewProvider {
    static var previews: some View {
        TabBarManager(selectedTab: .stocks)
    }
}
