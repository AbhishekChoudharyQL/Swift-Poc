//
//  FavouriteView.swift
//  MusicApp
//
//  Created by abhishek on 03/04/23.
//

import SwiftUI

struct FavouriteView: View {
    var body: some View {
//        ZStack{

        VStack {
                ScrollView(.horizontal) {
                    LazyHStack {

                    }
                }
                Spacer()
            }
        .onAppear(){
        }
    }
       
}

struct FavouriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteView()
            
    }
}
