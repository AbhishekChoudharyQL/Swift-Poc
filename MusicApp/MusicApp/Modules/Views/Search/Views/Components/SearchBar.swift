//
//  SearchBar.swift
//  MusicApp
//
//  Created by abhishek on 10/04/23.
//

import SwiftUI

struct SearchBar: View {
//    @ObservedObject var searchApi = SearchApi()
//    @ObservedObject var searchApi = SearchApiViewModel()
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
//                    searchApi.getSearchResults(parameter: text)
//                    SearchApiViewModel().getSearchResults(parameter: text)
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
