//
//  PlaylistView.swift
//  MusicApp
//
//  Created by abhishek on 17/04/23.
//

import SwiftUI
//
//struct PlaylistView: View {
//    @ObservedObject var playlistViewModel = PlaylistViewModel()
//    var body: some View {
//        VStack(content: {
//        ForEach(playlistViewModel.playlistData1,id: \.data){
//            playlistResponse in
//            if let data = playlistResponse.data {
//                ForEach(data,id: \.id) {
//                    playlistData in
//                    let imageURL = URL(string: playlistData.picture ?? "")
//                    if let imageURL = imageURL {
//                        AsyncImageModifierForPlaylist(imageUrl: imageURL)
//                    } else {
//                        DefaultPlaceholderImage()
//                    }
//                    TextModifierForSmallCaptions(texttoBeModified: playlistData.title ?? "")
//                     }
//                   }
//                }
//            })
//        .onAppear {
//            playlistViewModel.getPlaylistData()
//        }
//    }
//}
//
//struct PlaylistView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlaylistView()
//    }
//}
