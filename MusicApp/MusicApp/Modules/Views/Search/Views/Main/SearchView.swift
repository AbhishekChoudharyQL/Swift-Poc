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
//            Image("musichome")
//                .resizable()
//                .opacity(0.8)
//                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Search Your Favorites")
                    .foregroundColor(AppColor.lightColor)
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
        }.background(AppColor.backgroundColor)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
