//
//  AudioPlayerView.swift
//  MusicApp
//
//  Created by abhishek on 04/04/23.
//

import SwiftUI



struct AudioPlayerView: View {
    //MARK: - Properties
    @State private var yoffSet : CGFloat = 0
    //MARK: - View Builder
    var body: some View {
        ZStack{
            Image("musichome")
                .resizable()
                .scaledToFill()
                .opacity(1.0)
                .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height)
                .edgesIgnoringSafeArea(.top)
            
            VStack(alignment: .center,spacing: 30, content: {
                // 𝐂𝐚𝐥𝐥𝐢𝐧𝐠 𝐀𝐮𝐝𝐢𝐨𝐒𝐜𝐫𝐞𝐞𝐧𝐁𝐮𝐭𝐭𝐨𝐧𝐬𝐕𝐢𝐞𝐰 𝐭𝐨 𝐝𝐢𝐬𝐩𝐥𝐚𝐲 𝐛𝐮𝐭𝐭𝐨𝐧𝐬 𝐨𝐟 𝐦𝐢𝐧𝐢 𝐩𝐥𝐚𝐲𝐞𝐫...
                AudioScreenButtons(buttonName: "heart")
                    .overlay(alignment: .topTrailing, content: {
                        
                    }).padding(.top,30)
                // 𝐂𝐚𝐥𝐥𝐢𝐧𝐠 𝐀𝐮𝐝𝐢𝐨𝐈𝐦𝐚𝐠𝐞 𝐭𝐨 𝐬𝐡𝐨𝐰 𝐢𝐦𝐚𝐠𝐞 𝐨𝐟 𝐬𝐨𝐧𝐠 𝐛𝐞𝐢𝐧𝐠 𝐩𝐥𝐚𝐲𝐞𝐝...
                AudioImageView()
                    .padding(.leading,30)
                    .padding(.trailing,30)
                    .padding(.bottom,-20)
                
//                Text("Song-Name")
                //                    .foregroundColor(.white)
                //                    .font(.largeTitle)
                //                    .fontWeight(.bold)
                //                    .padding()
                // 𝐂𝐚𝐥𝐥𝐢𝐧𝐠 𝐓𝐞𝐱𝐭 𝐌𝐨𝐝𝐢𝐟𝐢𝐞𝐫 𝐄𝐧𝐮𝐦 ..
                SongNameTextModifier(text: "Song-Name", modifier: .AudioPlayerText)
                // 𝐂𝐚𝐥𝐥𝐢𝐧𝐠 𝐒𝐨𝐧𝐠𝐃𝐮𝐫𝐚𝐭𝐢𝐨𝐧 𝐬𝐥𝐢𝐝𝐞𝐫 𝐭𝐨 𝐬𝐡𝐨𝐰 𝐝𝐮𝐫𝐚𝐭𝐢𝐨𝐧 𝐨𝐟 𝐬𝐨𝐧𝐠 𝐩𝐥𝐚𝐲𝐞𝐝...
                SongDurationSlider()
        
                HStack(alignment: .center,spacing: 80, content: {
                    //:- Calling AudioScreenButtonsView to display buttons of mini player...
                    AudioScreenButtons(buttonName: "backward.circle.fill")
                    AudioScreenButtons(buttonName: "play.circle.fill")
                    AudioScreenButtons(buttonName: "forward.circle.fill")
                })
            }).frame(width: UIScreen.main.bounds.width,height:UIScreen.main.bounds.height)
                .padding()
        }
    }
}

struct AudioPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        AudioPlayerView()
    }
}
