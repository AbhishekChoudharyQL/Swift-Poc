//
//  SearchBar.swift
//  MusicApp
//
//  Created by abhishek on 10/04/23.
//

import SwiftUI
struct SearchBar: View {
    //MARK: - Properties
    @ObservedObject var searchApi : SearchApiViewModel
    @Binding var text: String
    @Binding var showCancelButton: Bool
    //MARK: - View Builder
     var body: some View {
         HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)

            TextField("Search", text: $searchApi.serchbrtext, onEditingChanged: { isEditing in
                self.showCancelButton = true
                print("Before")
                print(searchApi.serchbrtext)
            }, onCommit: {
                print("After")
                print(searchApi.serchbrtext)
                searchApi.ischanging = true
                searchApi.getSearchResults(parameter: searchApi.serchbrtext)

            })
                .foregroundColor(.white)

            Button(action: {
                self.searchApi.serchbrtext = ""
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
   //MARK: - Previews
   struct SearchBar_Previews: PreviewProvider {
      static var previews: some View {
          SearchBar(searchApi: SearchApiViewModel(), text: .constant(""), showCancelButton: .constant(false))
    }
}
//
