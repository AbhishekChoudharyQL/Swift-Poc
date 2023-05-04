//
//  ContentView.swift
//  LocationSearch
//
//  Created by abhishek on 03/05/23.
//

import SwiftUI

struct HomeView: View {
    
    //MARK: - View Builder
    var body: some View {
        NavigationView(content: {
            SearchView()
                .navigationBarHidden(true)
        })
    }
}

//MARK: - Previews
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
