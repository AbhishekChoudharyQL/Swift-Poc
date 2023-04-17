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
    // 𝐏𝐚𝐫𝐞𝐧𝐭 𝐕𝐬𝐭𝐚𝐜𝐤 𝐭𝐨 𝐡𝐨𝐥𝐝 𝐭𝐢𝐭𝐥𝐞, 𝐚𝐫𝐭𝐢𝐬𝐭𝐬-𝐬𝐜𝐫𝐨𝐥𝐥𝐕𝐢𝐞𝐰, 𝐩𝐥𝐚𝐲𝐥𝐢𝐬𝐭-𝐬𝐜𝐫𝐨𝐥𝐥𝐕𝐢𝐞𝐰..
        VStack(alignment: .center) {
          LogoView()
          TextModifierForLargeTitle(text: "Recommended Artist")
        ScrollView(.horizontal, showsIndicators: false) {
        HStack{
            ForEach(artistApi.artists, id: \.id) { artist in
                VStack {
                let imageURL = URL(string: artist.picture_medium ?? "")
                if let imageURL = imageURL {
                      AsyncImageModifierArtist(imageUrl: imageURL)
                        } else {
                         DefaultPlaceholderImage()
                        }
                    TextModifierForSmallCaptions(texttoBeModified: artist.name ?? "")
                    }
                }
            }
        }.frame(width: UIScreen.main.bounds.width, height: 200) //: - 𝙎𝙘𝙧𝙤𝙡𝙡 𝙑𝙞𝙚𝙬 𝙛𝙤𝙧 𝙖𝙧𝙩𝙞𝙨𝙩𝙨 𝙚𝙣𝙙𝙨 𝙝𝙚𝙧𝙚...
        // 𝐏𝐥𝐚𝐲𝐥𝐢𝐬𝐭 𝐡𝐞𝐚𝐝𝐥𝐢𝐧𝐞 𝐬𝐭𝐚𝐫𝐭𝐬 𝐡𝐞𝐫𝐞..
      TextModifierForLargeTitle(text: "𝑻𝒓𝒆𝒏𝒅𝒊𝒏𝒈 𝑷𝒍𝒂𝒚𝒍𝒊𝒔𝒕")
         HStack(content: {
            VStack(content: {
            ForEach(playlistViewModel.playlistData,id: \.data){
                playlistResponse in
                if let data = playlistResponse.data {
                    ForEach(data,id: \.id) {
                        playlistData in
                        let imageURL = URL(string: playlistData.picture ?? "")
                        if let imageURL = imageURL {
                            AsyncImageModifierForPlaylist(imageUrl: imageURL)
                        } else {
                            DefaultPlaceholderImage()
                        }
                        TextModifierForSmallCaptions(texttoBeModified: playlistData.title ?? "")
                         }
                       }
                    }
                })
            })
         }  // 𝐏𝐚𝐫𝐞𝐧𝐭 𝐕𝐬𝐭𝐚𝐜𝐤 𝐞𝐧𝐝𝐬 𝐡𝐞𝐫𝐞 𝐭𝐡𝐚𝐭 𝐡𝐨𝐥𝐝𝐬 𝐓𝐢𝐭𝐥𝐞,𝐚𝐫𝐭𝐢𝐬𝐭, 𝐩𝐥𝐚𝐲𝐥𝐢s𝐭𝐬..
      }
    } // 𝐙𝐬𝐭𝐚𝐜𝐤 𝐞𝐧𝐝𝐬 𝐡𝐞𝐫𝐞 ..
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
