//
//  MiniPlayerView.swift
//  MusicApp
//
//  Created by abhishek on 06/04/23.
//

import SwiftUI

struct MiniPlayerView: View {
    //MARK: - Properties
    @State var opacityOfMiniPlayer : Double = 1
    @State var heightOfMiniPlayer : CGFloat = 0
    @State var floatingStatusOfMiniPlayer = false
    //MARK: - View Builder
    var body: some View {
        HStack(alignment: .top,spacing: 25,content: {
            //:- Setting up song image to display in mini player ..
           Image("juja-han-uT55XxQLQGU-unsplash")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width/14,height: UIScreen.main.bounds.height/7)
            Spacer()
            //:- Setting up text to display song name in mini palyer..
            Text("Song-Name")
                .foregroundColor(Color.white)
                .fontDesign(.serif)
                .font(.custom("Helvitica", fixedSize: 28))
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.top)
            //:- Calling AudioScreenButtonsView to display buttons of mini player...
               AudioScreenButtons(buttonName: "play.circle.fill")
                .padding(.top)
                AudioScreenButtons(buttonName: "forward.circle.fill")
                .padding(.top)
        }).background(AppColor.sliderAccentColor)
            .frame(width: UIScreen.main.bounds.width,height: 95)

    }
}
//MARK: - Previews
struct MiniPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        MiniPlayerView()
    }
}

