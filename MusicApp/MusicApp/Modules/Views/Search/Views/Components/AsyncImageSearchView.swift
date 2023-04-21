//
//  AsyncImageSearchView.swift
//  MusicApp
//
//  Created by abhishek on 22/04/23.
//

import SwiftUI

struct AsyncImageSearchView: View {
    let imageUrl : URL
    var body: some View {
        AsyncImage(url: imageUrl) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
//                .clipShape(Circle())
//                .overlay(
//                    Rectangle().stroke(AppColor.greenSpotify,lineWidth: 2)
//                )
        } placeholder: {
            Image(systemName: "person.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
        }
    }
}

struct AsyncImageSearchView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageSearchView(imageUrl: URL(string: "https//")!)
    }
}
