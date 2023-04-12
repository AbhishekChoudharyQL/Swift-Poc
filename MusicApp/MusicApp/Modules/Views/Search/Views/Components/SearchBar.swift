//
//  SearchBar.swift
//  MusicApp
//
//  Created by abhishek on 10/04/23.
//

import SwiftUI

struct SearchBar: View {
//    @State private var searchText = ""
//    @State private var isEditing = false
//    var body: some View {
//        HStack(alignment:.center,spacing: 30,content: {
//            Image(systemName: "magnifyingglass")
//                .foregroundColor(Color.white)
//            TextField("Artists, Songs,Playlist", text: $searchText)
//                .foregroundColor(Color.purple)
//                .overlay(content: {
//                    Image(systemName: "xmark.circle.fill")
//                        .padding(.leading,30)
//                        .offset(x:50)
//                        .foregroundColor(Color.white)
//                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
//                        .onTapGesture {
//                            searchText = ""
//                        }
//                })
//        })
//        .font(.headline)
//        .padding()
//        .background(
//            RoundedRectangle(cornerRadius: 35)
//                .fill(Color.white).opacity(0.6)
//                .shadow(color: .black, radius: 15,x: 0,y: 0)
//        )
//    }
    @Binding var text: String
        @Binding var showCancelButton: Bool
        
        var body: some View {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                
                TextField("Search", text: $text, onEditingChanged: { isEditing in
                    self.showCancelButton = true
                }, onCommit: {
                    // Do search functionality here
                })
                    .foregroundColor(.white)
                
                Button(action: {
                    self.text = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
                .opacity(text == "" ? 0 : 1)
            }
            .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
            .background(Color.white.opacity(0.1))
            .cornerRadius(8)
            
            if showCancelButton {
                Button("Cancel") {
                    self.text = ""
                    self.showCancelButton = false
                }
                .foregroundColor(.white)
            }
        }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""), showCancelButton: .constant(false))
    }
}
