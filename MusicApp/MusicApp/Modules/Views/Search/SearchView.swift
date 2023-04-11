//
//  SearchView.swift
//  MusicApp
//
//  Created by abhishek on 03/04/23.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @State private var showCancelButton: Bool = false
    var body: some View {
        ZStack{
            Image("musichome")
                .resizable()
                .opacity(0.8)
                //.ignoresSafeArea()
                
            VStack {
                Text("Search Your Favorites")
                    .foregroundColor(.white)
                    .bold()
                    .font(.largeTitle)
                   SearchBar()
                       Spacer()

            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
