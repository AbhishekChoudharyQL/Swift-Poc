//
//  HomeView.swift
//  MusicApp
//
//  Created by abhishek on 03/04/23.
//

import SwiftUI

//artist json = "https://api.jsonserve.com/A5rmJ5"
struct HomeView: View {
    //MARK: - Properties
//    @EnvironmentObject var networking : Networking
    @State var isAnimating = false
    //MARK: - View Builder
    var body: some View {
        ZStack {
            //: - 𝑺𝒆𝒕𝒕𝒊𝒏𝒈 𝒖𝒑 𝒃𝒂𝒄𝒌𝒈𝒓𝒐𝒖𝒏𝒅 𝒊𝒎𝒂𝒈𝒆𝒔 𝒇𝒐𝒓 𝒉𝒐𝒎𝒆 𝒔𝒄𝒓𝒆𝒆𝒏 𝒊𝒏𝒔𝒊𝒅𝒆 𝒁𝒔𝒕𝒂𝒄𝒌..
            Image("musichome")
                .resizable()
                //.ignoresSafeArea()
                .scaledToFill()
                .opacity(isAnimating ? 1.0 : 0.38)
            //: - 𝐏𝐚𝐫𝐞𝐧𝐭 𝐕𝐬𝐭𝐚𝐜𝐤 𝐭𝐨 𝐡𝐨𝐥𝐝 𝐭𝐢𝐭𝐥𝐞, 𝐚𝐫𝐭𝐢𝐬𝐭𝐬-𝐬𝐜𝐫𝐨𝐥𝐥𝐕𝐢𝐞𝐰, 𝐩𝐥𝐚𝐲𝐥𝐢𝐬𝐭-𝐬𝐜𝐫𝐨𝐥𝐥𝐕𝐢𝐞𝐰..
            VStack(alignment: .center) {
                //: - Setting up title for home screen..
                Text("onbeats Music")
                    .foregroundColor(.white)
                    .font(.custom("Georgia", size: 45, relativeTo: .headline))
                    .bold().padding(.bottom, 20)
                
                //: 𝙑𝙨𝙩𝙖𝙘𝙠 𝙩𝙤 𝙙𝙞𝙨𝙥𝙡𝙖𝙮 "𝙍𝙚𝙘𝙤𝙢𝙢𝙚𝙣𝙙𝙚𝙙 𝘼𝙧𝙩𝙞𝙨𝙩 𝙏𝙞𝙩𝙡𝙚" 𝙖𝙣𝙙 𝙨𝙘𝙧𝙤𝙡𝙡𝙫𝙞𝙚𝙬 𝙤𝙛 𝙖𝙧𝙩𝙞𝙨𝙩𝙨..
                Text("Recommended Artist")
                    .foregroundColor(Color.white)
                    .font(.title2)
                    .bold()
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack{
                        ForEach(0..<4, id: \.self){ index in
                            VStack {
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(Color.white)
                                    .frame(width: 200 , height: 150)
                                    .shadow(color: .pink, radius: 10 )

                                Text("Artist-Name")
                                    .foregroundColor(.white)
                            }
                        }.padding()
//                        ForEach(networking.artists,id: \.self){ artistData in
//                            VStack {
//                                Image("\(artistData.picture_medium)")
//                                    .frame(width: 200,height: 300)
//                                    .shadow(color: .pink,radius: 10)
//                                Text("\(artistData.name)")
//                                    .foregroundColor(.white)
//                            }
//
//                        }
                    }
                }.frame(width: UIScreen.main.bounds.width, height: 200)//: - 𝙎𝙘𝙧𝙤𝙡𝙡 𝙑𝙞𝙚𝙬 𝙛𝙤𝙧 𝙖𝙧𝙩𝙞𝙨𝙩𝙨 𝙚𝙣𝙙𝙨 𝙝𝙚𝙧𝙚...
                //:- 𝐏𝐥𝐚𝐲𝐥𝐢𝐬𝐭 𝐡𝐞𝐚𝐝𝐥𝐢𝐧𝐞 𝐬𝐭𝐚𝐫𝐭𝐬 𝐡𝐞𝐫𝐞..
                Text("𝑻𝒓𝒆𝒏𝒅𝒊𝒏𝒈 𝑷𝒍𝒂𝒚𝒍𝒊𝒔𝒕")
                    .foregroundColor(Color.white)
                    .font(.title2)
                    .bold()
                //:- 𝐕𝐞𝐫𝐭𝐢𝐜𝐚𝐥 𝐒𝐜𝐫𝐨𝐥𝐥 𝐯𝐢𝐞𝐰 𝐟𝐨𝐫 𝐩𝐥𝐚𝐲𝐥𝐢𝐬𝐭𝐬..
                ScrollView(showsIndicators: false) {
                    ForEach(0..<8){
                        index in
                        HStack{ //:- 𝐏𝐚𝐫𝐞𝐧𝐭 𝐇𝐬𝐭𝐚𝐜𝐤 𝐭𝐨 𝐡𝐨𝐥𝐝 𝐩𝐥𝐚𝐲𝐥𝐢𝐬𝐭𝐬..
                            VStack{
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(Color.white)
                                    .frame(height: 150)
                                    .shadow(color: .pink, radius: 10 )
                                    .padding(.trailing, 5)
                                
                                Text("Playlist-Name")
                                    .foregroundColor(.white)
                            }
                            
                            VStack{
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(Color.white)
                                    .frame(height: 150)
                                    .shadow(color: .pink, radius: 10 )
                                    .padding(.leading, 5)
                                
                                Text("Playlist-Name")
                                    .foregroundColor(.white)
                            }
                            
                        }.frame(width: UIScreen.main.bounds.width * 0.9)
                    } //:- 𝗟𝗼𝗼𝗽 𝗲𝗻𝗱𝘀 𝗵𝗲𝗿𝗲..
                } //:- 𝐕𝐞𝐫𝐭𝐢𝐜𝐚𝐥 𝐒𝐜𝐫𝐨𝐥𝐥 𝐕𝐢𝐞𝐰 𝐞𝐧𝐝𝐬 𝐡𝐞𝐫𝐞 ..
            }  //: - 𝐏𝐚𝐫𝐞𝐧𝐭 𝐕𝐬𝐭𝐚𝐜𝐤 𝐞𝐧𝐝𝐬 𝐡𝐞𝐫𝐞 𝐭𝐡𝐚𝐭 𝐡𝐨𝐥𝐝𝐬 𝐓𝐢𝐭𝐥𝐞,𝐚𝐫𝐭𝐢𝐬𝐭, 𝐩𝐥𝐚𝐲𝐥𝐢s𝐭𝐬..
        } //: - 𝐙𝐬𝐭𝐚𝐜𝐤 𝐞𝐧𝐝𝐬 𝐡𝐞𝐫𝐞 ..
        .onAppear {
            withAnimation(.easeIn(duration: 1.58)){
                isAnimating = true
            }
        }
    }
}
//MARK: - Previews
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
//            .environmentObject(Networking())
           
    }
}
