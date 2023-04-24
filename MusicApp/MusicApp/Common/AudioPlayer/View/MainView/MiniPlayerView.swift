//
//  MiniPlayerView.swift
//  MusicApp
//
//  Created by abhishek on 06/04/23.
//
//UIScreen.main.bounds.width/20
import SwiftUI

struct MiniPlayerView: View {
    //MARK: - Properties
    @StateObject var audioPlayerViewModel : AudioPlayerViewModel
    @StateObject var miniplayeSongTitleManager : SearchApiViewModel
    //MARK: - View Builder
    var body: some View {
        HStack(alignment: .top,spacing: 0,content: {
            // 𝐒𝐞𝐭𝐭𝐢𝐧𝐠 𝐮𝐩 𝐬𝐨𝐧𝐠 𝐢𝐦𝐚𝐠𝐞 𝐭𝐨 𝐝𝐢𝐬𝐩𝐥𝐚𝐲 𝐢𝐧 𝐦𝐢𝐧𝐢 𝐩𝐥𝐚𝐲𝐞𝐫 ..
           Image("music")
                .resizable()
                .scaledToFill()
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .frame(width: 50,height: UIScreen.main.bounds.height/12)
                .padding(.leading,5)
                .padding(.bottom,5)
            Spacer()
            HStack(alignment: .top){
                SongNameTextModifier(text: audioPlayerViewModel.songTitle.isEmpty ? "Play Music":audioPlayerViewModel.songTitle, modifier: .MiniplayerText)
                    .padding(.trailing,10)
                // 𝐂𝐚𝐥𝐥𝐢𝐧𝐠 𝐀𝐮𝐝𝐢𝐨𝐒𝐜𝐫𝐞𝐞𝐧𝐁𝐮𝐭𝐭𝐨𝐧𝐬𝐕𝐢𝐞𝐰 𝐭𝐨 𝐝𝐢𝐬𝐩𝐥𝐚𝐲 𝐛𝐮𝐭𝐭𝐨𝐧𝐬 𝐨𝐟 𝐦𝐢𝐧𝐢 𝐩𝐥𝐚𝐲𝐞𝐫...
                AudioScreenButtons(buttonName: audioPlayerViewModel.playerState == .isPaused ? "play.circle.fill" :"pause.circle.fill", buttonAction: {
                    audioPlayerViewModel.setupAudio()
                })
                    .padding(.top)
                    .padding(.trailing)
                AudioScreenButtons(buttonName: "forward.circle.fill", buttonAction: {
                    
                })
                    .foregroundColor(.white)
                    .padding(.top)
            }
            Spacer()
        })
        .background(AppColor.backgroundColor)
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.01)
    }
}

//MARK: - Previews
struct MiniPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        MiniPlayerView(audioPlayerViewModel: AudioPlayerViewModel(), miniplayeSongTitleManager: SearchApiViewModel())
    }
}

