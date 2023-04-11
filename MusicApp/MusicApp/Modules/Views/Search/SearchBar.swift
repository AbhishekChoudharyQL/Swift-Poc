//
//  SearchBar.swift
//  MusicApp
//
//  Created by abhishek on 10/04/23.
//

import SwiftUI

struct SearchBar: View {
    @State private var searchText = ""
    var body: some View {
        HStack(alignment:.center,spacing: 30,content: {
            Image(systemName: "magnifyingglass")
                .foregroundColor(Color.white)
            TextField("Artists, Songs,Playlist", text: $searchText)
                .foregroundColor(Color.purple)
                .overlay(content: {
                    Image(systemName: "xmark.circle.fill")
                        .padding(.leading,30)
                        .offset(x:50)
                        .foregroundColor(Color.white)
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            searchText = ""
                        }
                })
        })
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 35)
                .fill(Color.white).opacity(0.6)
                .shadow(color: .black, radius: 15,x: 0,y: 0)
        )
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar()
    }
}
