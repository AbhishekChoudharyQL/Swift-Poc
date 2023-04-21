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
                        ForEach(viewModel.searchResult){
                            index in
                            HStack(content: {
//                                VStack(spacing: 20,content: {
                                    let url = URL(string: index.artist.picture_medium)
                                    if let url = url {
                                    AsyncImageSearchView(imageUrl: url)
                                    } else{
                                        DefaultPlaceholderImage()
                                    }
                                    Text(index.title ?? "No result")
                                        .foregroundColor(.white)
                                        .font(.subheadline)
//                                })
                                Spacer()
                                Image(systemName: "play.circle.fill")
                                    .foregroundColor(AppColor.greenSpotify)
                            }).frame(height: 20)
                                .padding()
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    print("search list tapped")
                                }
                            }
                        }).padding(.leading,5)
                          .padding(.trailing,5)
                         .padding(.bottom, 180)
                } // Scroll View Ends here ...
                
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
    
