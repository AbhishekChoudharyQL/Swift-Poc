//
//  SearchBar.swift
//  MusicApp
//
//  Created by abhishek on 10/04/23.
//

import SwiftUI
struct SearchBar: View {
    //MARK: - Properties
    @StateObject var searchViewModel : SearchApiViewModel
    @Binding var text: String
    @Binding var showCancelButton: Bool
    
    //MARK: - View Builder
     var body: some View {
         HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            TextField("Search", text: $searchViewModel.serchbrtext, onEditingChanged: { isEditing in
                self.showCancelButton = true
                print(searchViewModel.serchbrtext)
            }, onCommit: {
                searchViewModel.ischanging = true
                searchViewModel.getSearchResults(parameter: searchViewModel.serchbrtext)
            })
                .foregroundColor(.white)
            Button(action: {
                self.searchViewModel.serchbrtext = ""
                emptyArray()
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
                emptyArray()
            }
            .foregroundColor(.white)
          }
        }
    
    //MARK: - Methods
   func emptyArray(){
       searchViewModel.searchResult = []
   }
 }

   //MARK: - Previews
   struct SearchBar_Previews: PreviewProvider {
      static var previews: some View {
          SearchBar(searchViewModel: SearchApiViewModel(), text: .constant(""), showCancelButton: .constant(false))
    }
}

