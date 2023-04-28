//
//  ContentView.swift
//  StockApp
//
//  Created by abhishek on 27/04/23.
//

import SwiftUI

struct HomeView: View {
    
    //MARK: - Properties
    @State var selectedTab : TabItems = .stocks
    init(){
        UITabBar.appearance().isHidden = true
    }
    
    //MARK: - View Builder
    var body: some View {
        ZStack(content: {
            TabBarManager(selectedTab: selectedTab)
        })
    }
}

 // MARK: - Previews
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

