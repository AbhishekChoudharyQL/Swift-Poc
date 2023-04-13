//
//  FavouriteView.swift
//  MusicApp
//
//  Created by abhishek on 03/04/23.
//

import SwiftUI

struct FavouriteView: View {
  
    var body: some View {
        ZStack{
            VStack(content: {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    .foregroundColor(AppColor.greenSpotify)
                Spacer()
            })
        }.background(AppColor.backgroundColor)
//        .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height)
            
            
    }
       
}

struct FavouriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteView()
            .environmentObject(PlaylistApi())
    }
}
