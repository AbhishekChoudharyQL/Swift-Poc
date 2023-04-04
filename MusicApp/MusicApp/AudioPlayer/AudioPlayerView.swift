//
//  AudioPlayerView.swift
//  MusicApp
//
//  Created by abhishek on 04/04/23.
//

import SwiftUI

struct AudioPlayerView: View {
    var body: some View {
        ZStack{
            Image("marcela-laskoski-YrtFlrLo2DQ-unsplash")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .opacity(0.7)
            VStack(alignment: .leading,spacing: 50, content: {
                AudioScreenButtons(buttonName: "heart")
                    .overlay(alignment: .topTrailing, content: {
                        
                    })
                AudioImageView()
                    .padding(.all ,30)
                HStack(alignment: .center,spacing: 80, content: {
                    AudioScreenButtons(buttonName: "backward.circle.fill")
                    AudioScreenButtons(buttonName: "play.circle.fill")
                    AudioScreenButtons(buttonName: "forward.circle.fill")
                })
                SongDurationSlider()
            })
        }
    }
}

struct AudioPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        AudioPlayerView()
    }
}
