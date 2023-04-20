//
//  HomeView.swift
//  MusicApp
//
//  Created by abhishek on 03/04/23.
//

import SwiftUI

struct HomeView: View {
    
    //MARK: - Observed Properties
    @ObservedObject var artistApi = ArtistApi()
    @ObservedObject var playlistViewModel = PlaylistViewModel()
    @State var isAnimating = false
    
    //MARK: - View Builder
    var body: some View {
        ZStack {
            ScrollView(.vertical,showsIndicators: false){
                VStack(alignment: .center) {
                    LogoView()
                    TextModifierForLargeTitle(text: "Recommended Artist")
                    RecommendedArtistsHorizontalList(artistApi: artistApi)
                    TextModifierForLargeTitle(text: "𝑻𝒓𝒆𝒏𝒅𝒊𝒏𝒈 𝑷𝒍𝒂𝒚𝒍𝒊𝒔𝒕")
                    PlaylistCollectionView(playlistData: $playlistViewModel.playlistCollectionViewData)
                        .padding(.bottom, 180)
                }
            }
        }
        .background(AppColor.backgroundColor)
        .onAppear {
            artistApi.getArtists(ids: [], completion:{
            })
            playlistViewModel.getPlaylistData()
        }
    }
}

//MARK: - Previews
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct RecommendedArtistsHorizontalList: View {
    //MARK: - Properties
    @ObservedObject var artistApi : ArtistApi
    
    //MARK: - View Builder
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack{
                ForEach(artistApi.artists, id: \.id) { artist in
                    VStack(alignment: .center) {
                        let imageURL = URL(string: artist.picture_medium ?? "")
                        if let imageURL = imageURL {
                            AsyncImageModifierArtist(imageUrl: imageURL)
                        } else {
                            DefaultPlaceholderImage()
                        }
                        TextModifierForSmallCaptions(texttoBeModified: artist.name ?? "")
                    }.frame(width: 112,height: 124)
                }
            }
        }.frame(width: UIScreen.main.bounds.width, height: 200)
    }
}
