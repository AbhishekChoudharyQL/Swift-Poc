//
//  ScrollViewArtist.swift
//  MusicApp
//
//  Created by abhishek on 17/04/23.
//

import SwiftUI

//struct ScrollViewArtist: View {
//    @ObservedObject var artistApi = ArtistApi()
//    var body: some View {
//        ScrollView(.horizontal, showsIndicators: false) {
//        HStack{
//            ForEach(artistApi.artists, id: \.id) { artist in
//                VStack {
//                let imageURL = URL(string: artist.picture_medium ?? "")
//                if let imageURL = imageURL {
//                      AsyncImageModifierArtist(imageUrl: imageURL)
//                        } else {
//                         DefaultPlaceholderImage()
//                        }
//                    TextModifierForSmallCaptions(texttoBeModified: artist.name ?? "")
//                    }
//                }
//            }
//        }
//        .onAppear {
//            artistApi.getArtists(ids: [], completion:{
//             })
//        }
//    }
//}
//
//struct ScrollViewArtist_Previews: PreviewProvider {
//    static var previews: some View {
//        ScrollViewArtist()
//    }
//}
