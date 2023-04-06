//
//  MiniPlayerView.swift
//  MusicApp
//
//  Created by abhishek on 06/04/23.
//

import SwiftUI

struct MiniPlayerView: View {
    @State var opacityOfMiniPlayer : Double = 1
    @State var heightOfMiniPlayer : CGFloat = 0
    @State var floatingStatusOfMiniPlayer = false
    //MARK: - View Builder
    var body: some View {
        HStack(spacing: 12,content: {
            //:- Setting up song image to display in mini player ..
           Image("juja-han-uT55XxQLQGU-unsplash")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width/14,height: UIScreen.main.bounds.height/7)
                .padding(.trailing,40)
            //:- Setting up text to display song name in mini palyer..
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
    }
}
//MARK: - Previews
struct MiniPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        MiniPlayerView()
    }
}
