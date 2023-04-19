//
//  SearchView.swift
//  MusicApp
//
//  Created by abhishek on 03/04/23.
//

import SwiftUI

struct SearchView: View {
    //MARK: - Properties
    @ObservedObject var  viewModel = SearchApiViewModel()
    @State private var showCancelButton: Bool = false
   //MARK: - View Builder
    var body: some View {
        ZStack {
        VStack {
            Text("Search Your Favorites")
                .foregroundColor(AppColor.greenSpotify)
                .bold()
                .font(.largeTitle)
            SearchBar(text: $viewModel.serchbrtext, showCancelButton: $showCancelButton)
                .padding(.horizontal)
        ScrollView {
            ForEach(viewModel.searchResult){
                index in
                VStack(alignment: .leading,content: {
                    HStack(content: {
                        Text(index.title ?? "No result")
                            .foregroundColor(.white)
                            .font(.subheadline)
                        Spacer()
                        Button{
                           print("Button-Tap")
                        } label: {
                            Label("Play", systemImage: "play.circle")
                             .foregroundColor(AppColor.greenSpotify)
                            }
                         })
                      }).frame(height: 20)
                        .padding(.leading,5)
                        .padding(.trailing,5)
                    }
                }
            }
        }.background(AppColor.backgroundColor)
            .onAppear{
            viewModel.getSearchResults(parameter: viewModel.serchbrtext)
        }
    }
}
 //MARK: - Previews
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
