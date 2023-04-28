//
//  ContentView.swift
//  StockApp
//
//  Created by abhishek on 27/04/23.
//

import SwiftUI

struct HomeView: View {
    @State var selectedTab : TabItems = .stocks
    init(){
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        ZStack(content: {
            TabBarManager(selectedTab: selectedTab)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

