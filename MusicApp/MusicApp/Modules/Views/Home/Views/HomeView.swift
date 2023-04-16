//
//  HomeView.swift
//  MusicApp
//
//  Created by abhishek on 03/04/23.
//

import SwiftUI

struct HomeView: View {
    //MARK: - Properties
    @ObservedObject var artistApi = ArtistApi()
    @State var isAnimating = false
    //MARK: - View Builder
    var body: some View {
        ZStack {
            // 𝐏𝐚𝐫𝐞𝐧𝐭 𝐕𝐬𝐭𝐚𝐜𝐤 𝐭𝐨 𝐡𝐨𝐥𝐝 𝐭𝐢𝐭𝐥𝐞, 𝐚𝐫𝐭𝐢𝐬𝐭𝐬-𝐬𝐜𝐫𝐨𝐥𝐥𝐕𝐢𝐞𝐰, 𝐩𝐥𝐚𝐲𝐥𝐢𝐬𝐭-𝐬𝐜𝐫𝐨𝐥𝐥𝐕𝐢𝐞𝐰..
        ScrollView(.vertical,showsIndicators: false){
          VStack(alignment: .center) {
            HStack( content: {
                Image("onbeats-logo")
                .resizable()
                .scaledToFit()
                })
                Text("Recommended Artist")
                .foregroundColor(Color.white)
                .font(.title2)
                .bold()
              ScrollView(.horizontal, showsIndicators: false) {
                    HStack{
                        ForEach(artistApi.artists, id: \.id) { artist in
                            VStack {
                            let imageURL = URL(string: artist.picture_medium ?? "")
                              if let imageURL = imageURL {
                                AsyncImage(url: imageURL) { image in
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
                                          } else {
                                                Image(systemName: "person.fill")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 100, height: 100)
                                                     }
                                    Text(artist.name ?? "")
                                        .font(.caption)
                                        .foregroundColor(.white)
                                }
                            }
                        }
                    }.frame(width: UIScreen.main.bounds.width, height: 200)//: - 𝙎𝙘𝙧𝙤𝙡𝙡 𝙑𝙞𝙚𝙬 𝙛𝙤𝙧 𝙖𝙧𝙩𝙞𝙨𝙩𝙨 𝙚𝙣𝙙𝙨 𝙝𝙚𝙧𝙚...
                    // 𝐏𝐥𝐚𝐲𝐥𝐢𝐬𝐭 𝐡𝐞𝐚𝐝𝐥𝐢𝐧𝐞 𝐬𝐭𝐚𝐫𝐭𝐬 𝐡𝐞𝐫𝐞..
                    Text("𝑻𝒓𝒆𝒏𝒅𝒊𝒏𝒈 𝑷𝒍𝒂𝒚𝒍𝒊𝒔𝒕")
                        .foregroundColor(Color.white)
                        .font(.title2)
                        .bold()
                    // 𝐕𝐞𝐫𝐭𝐢𝐜𝐚𝐥 𝐒𝐜𝐫𝐨𝐥𝐥 𝐯𝐢𝐞𝐰 𝐟𝐨𝐫 𝐩𝐥𝐚𝐲𝐥𝐢𝐬𝐭𝐬..
                        ForEach(0..<8){
                            index in
                            HStack(spacing: 10){ // 𝐏𝐚𝐫𝐞𝐧𝐭 𝐇𝐬𝐭𝐚𝐜𝐤 𝐭𝐨 𝐡𝐨𝐥𝐝 𝐩𝐥𝐚𝐲𝐥𝐢𝐬𝐭𝐬..
                                VStack{
                                    RoundedRectangle(cornerRadius: 25)
                                        .fill(Color.white)
                                        .frame(height: 150)
                                        .shadow(color: AppColor.greenSpotify, radius: 8,x: 0,y: 0 )
                                        .padding(.trailing, 5)
                                    Text("Playlist-Name")
                                        .foregroundColor(Color.white)
                                }.padding(.trailing,10)
                                    .padding(.bottom,12)
                                VStack(spacing: 10){
                                    RoundedRectangle(cornerRadius: 25)
                                        .fill(Color.white)
                                        .frame(height: 150)
                                        .shadow(color: AppColor.greenSpotify, radius: 8,x: 0,y: 0 )
                                        .padding(.leading, 5)
                                    Text("Playlist-Name")
                                        .foregroundColor(Color.white)
                                }.padding(.trailing,10)
                                    .padding(.bottom,12)
                            }.frame(width: UIScreen.main.bounds.width * 0.9)
                        } // 𝗟𝗼𝗼𝗽 𝗲𝗻𝗱𝘀 𝗵𝗲𝗿𝗲..
                }  // 𝐏𝐚𝐫𝐞𝐧𝐭 𝐕𝐬𝐭𝐚𝐜𝐤 𝐞𝐧𝐝𝐬 𝐡𝐞𝐫𝐞 𝐭𝐡𝐚𝐭 𝐡𝐨𝐥𝐝𝐬 𝐓𝐢𝐭𝐥𝐞,𝐚𝐫𝐭𝐢𝐬𝐭, 𝐩𝐥𝐚𝐲𝐥𝐢s𝐭𝐬..
            }
        } // 𝐙𝐬𝐭𝐚𝐜𝐤 𝐞𝐧𝐝𝐬 𝐡𝐞𝐫𝐞 ..
        .background(AppColor.backgroundColor)
        .onAppear {
            artistApi.getArtists(ids: [], completion:{
            })
        }
    }
}
//MARK: - Previews
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(playlistNetworking())
    }
}
