//
//  ContentView.swift
//  LandMarks
//
//  Created by abhishek on 24/03/23.
//


import SwiftUI

struct ContentView: View {
    //MARK: - @State Varible
    @State private var selection: Tab = .featured
    
    //MARK: - Enum
    enum Tab {
        case featured
        case list
    }

    //MARK: - View Builder
    var body: some View {
        TabView(selection: $selection) {
           
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)

            LandmarkList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
    }
}

//MARK: - Previews
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
