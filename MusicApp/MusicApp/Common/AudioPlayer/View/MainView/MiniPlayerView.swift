//
//  MiniPlayerView.swift
//  MusicApp
//
//  Created by abhishek on 06/04/23.
//
//UIScreen.main.bounds.width/20
import SwiftUI

struct MiniPlayerView: View {
    //MARK: - View Builder
    var body: some View {
        HStack(alignment: .top,spacing: 10,content: {
            //:- Setting up song image to display in mini player ..
           Image("juja-han-uT55XxQLQGU-unsplash")
                .resizable()
                .scaledToFill()
                .frame(width: 30,height: UIScreen.main.bounds.height/7)
                .padding(.trailing)
            Spacer()
            HStack(alignment: .top){
                Text("Song-Name")
                    .foregroundColor(Color.white)
                    .fontDesign(.serif)
                    .font(.custom("Helvitica", fixedSize: 25))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.top)
                    .padding(.leading,15)
                //:- Calling AudioScreenButtonsView to display buttons of mini player...
                   AudioScreenButtons(buttonName: "play.circle.fill")
                    .padding(.top)
                    .padding(.trailing)
                   AudioScreenButtons(buttonName: "forward.circle.fill")
                    .padding(.top)
            }
            Spacer()
        })
        .background(AppColor.sliderAccentColor)
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.01)
        
    }
}
//MARK: - Previews
struct MiniPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        MiniPlayerView()
    }
}

