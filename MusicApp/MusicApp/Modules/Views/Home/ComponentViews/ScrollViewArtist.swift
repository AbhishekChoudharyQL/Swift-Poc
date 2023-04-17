//
//  ScrollViewArtist.swift
//  MusicApp
//
//  Created by abhishek on 17/04/23.
//

import SwiftUI

struct ScrollViewArtist: View {
    @ObservedObject var artistApi = ArtistApi()
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
        HStack{
            ForEach(artistApi.artists, id: \.id) { artist in
                VStack {
                    // Image
                    if let pictureMedium = artist.picture_medium, let imageURL = URL(string: pictureMedium), let imageURL = imageURL {
                        AsyncImageModifierArtist(imageUrl: imageURL)
                    } else {
                        DefaultPlaceholderImage()
                    }
                    
                    // Text
                    if let artistName = artist.name {
                        TextModifierForSmallCaptions(texttoBeModified: artistName)
                    }
                }
            }
            }
        }
    }
}

struct ScrollViewArtist_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewArtist()
    }
}
