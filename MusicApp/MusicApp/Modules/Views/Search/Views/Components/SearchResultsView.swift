//
//  SearchResultsView.swift
//  MusicApp
//
//  Created by abhishek on 22/04/23.
//

import SwiftUI

struct SearchResultsView: View {
    //MARK: - Properties
    @StateObject var viewModel : SearchApiViewModel
    @StateObject var audioPlayerViewModel : AudioPlayerViewModel
//    @ObservedObject var audioPlayerViewModel  : AudioPlayerViewModel

    //MARK: - View Builder
    var body: some View {
        ForEach(viewModel.searchResult){
            index in
            HStack(content: {
                let url = URL(string: index.artist.picture_medium)
                if let url = url {
                    AsyncImageSearchView(imageUrl: url)
                } else{
                    DefaultPlaceholderImage()
                }
                Text(index.title ?? "No result")
                    .foregroundColor(.white)
                    .font(.subheadline)
                Spacer()
                Image(systemName: "play.circle.fill")
                    .foregroundColor(AppColor.greenSpotify)
            }).frame(height: 20)
                .padding()
                .contentShape(Rectangle())
                .onTapGesture {
//                    print("search list tapped")
                    if let currentSongUrl = index.preview {
                        audioPlayerViewModel.currentSongUrl = currentSongUrl
                        audioPlayerViewModel.songTitle = index.title ?? "Music"
                        audioPlayerViewModel.setupAudio()
                     }
                 }
            }
    }
}
