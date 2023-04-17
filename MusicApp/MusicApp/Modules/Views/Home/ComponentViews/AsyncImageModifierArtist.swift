//
//  AsyncImageModifier.swift
//  MusicApp
//
//  Created by abhishek on 17/04/23.
//

import SwiftUI

struct AsyncImageModifierArtist: View {
    let imageUrl : URL
    var body: some View {
        AsyncImage(url: imageUrl) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 102, height: 105)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(AppColor.greenSpotify,lineWidth: 2)
                )
        } placeholder: {
            Image(systemName: "person.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
        }
    }
}

struct AsyncImageModifier_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageModifierArtist(imageUrl: URL(string: "")!)
    }
}
