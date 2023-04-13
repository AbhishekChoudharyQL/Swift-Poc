//
//  SearchView.swift
//  MusicApp
//
//  Created by abhishek on 03/04/23.
//

import SwiftUI

struct SearchView: View {
    //MARK: - Properties
    @State private var searchText = ""
    @State private var showCancelButton: Bool = false
    
    //MARK: - View Builder
    var body: some View {
        ZStack {
            VStack {
                Text("Search Your Favorites")
                    .foregroundColor(AppColor.greenSpotify)
                    .bold()
                    .font(.largeTitle)
                
                SearchBar(text: $searchText, showCancelButton: $showCancelButton)
                    .padding(.horizontal)
                
                ScrollView {
                    ForEach(0..<9) { index in
                        Text("Favorite Songs")
                            .foregroundColor(.white)
                    }
                }.padding(.bottom)
            }
        }
//        .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height)
        .background(AppColor.backgroundColor)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
