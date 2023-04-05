//
//  AudioPlayerView.swift
//  MusicApp
//
//  Created by abhishek on 04/04/23.
//

import SwiftUI

struct AudioPlayerView: View {
    @State private var isMinimised = false
    @State private var yoffSet : CGFloat = 0
    
    var body: some View {
        ZStack{
            Image("marcela-laskoski-YrtFlrLo2DQ-unsplash")
                .resizable()
                .scaledToFill()
                .opacity(0.78)
                .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height)
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center,spacing: 30, content: {
                AudioScreenButtons(buttonName: "heart")
                    .overlay(alignment: .topTrailing, content: {

                    }).padding(.zero)
                AudioImageView()
                    .padding(.leading,30)
                    .padding(.trailing,30)
                    .padding(.bottom,-20)
                Text("Song-Name")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                SongDurationSlider()
                HStack(alignment: .center,spacing: 80, content: {
                    AudioScreenButtons(buttonName: "backward.circle.fill")
                    AudioScreenButtons(buttonName: "play.circle.fill")
                    AudioScreenButtons(buttonName: "forward.circle.fill")
                })
               
                    .padding(.bottom,90)
            })
        }
    }
}

struct AudioPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        AudioPlayerView()
    }
}
