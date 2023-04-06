//
//  MiniPlayerView.swift
//  MusicApp
//
//  Created by abhishek on 06/04/23.
//

import SwiftUI

struct MiniPlayerView: View {
    //MARK: - View Builder
    var body: some View {
        ZStack(content: {
            HStack(spacing: 12,content: {
                //:- Setting up song image to display in mini player ..
               Image("juja-han-uT55XxQLQGU-unsplash")
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width/14)
                    .padding(.trailing,40)
//                //:- Setting up text to display song name in mini palyer..
                Text("Song-Name")
                    .foregroundColor(.white)
                    .fontDesign(.serif)
                    .font(.title3)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding()
                //:- Calling AudioScreenButtonsView to display buttons of mini player...
                   AudioScreenButtons(buttonName: "play.circle.fill")
                    AudioScreenButtons(buttonName: "forward.circle.fill")
            })
        }).frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height/9,alignment: .bottomLeading)
            .background(Color.brown)
            //: - Setting dynamic frame and background color to Z-stack which will hold every element..
    }
}
//MARK: - Previews
struct MiniPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        MiniPlayerView()
    }
}
