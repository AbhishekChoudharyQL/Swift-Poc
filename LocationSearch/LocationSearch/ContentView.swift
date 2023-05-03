//
//  ContentView.swift
//  LocationSearch
//
//  Created by abhishek on 03/05/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView(content: {
            SearchView()
                .navigationBarHidden(true)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
