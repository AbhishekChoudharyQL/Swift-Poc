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
                SearchBar(searchApi: viewModel, text: $viewModel.serchbrtext, showCancelButton: $showCancelButton)
                    .padding(.horizontal)
            ScrollView {
                    VStack(alignment: .leading,spacing: 10,content: {
                        SearchResultsView(viewModel: viewModel)
                        }).padding(.leading,5)
                          .padding(.trailing,5)
                         .padding(.bottom, 180)
                }
            }.background(AppColor.backgroundColor)
                .onAppear{
                    viewModel.getSearchResults(parameter: viewModel.serchbrtext)
            }
        }
    }
}

    //MARK: - Previews
    struct SearchView_Previews: PreviewProvider {
        static var previews: some View {
            SearchView()
        }
    }

