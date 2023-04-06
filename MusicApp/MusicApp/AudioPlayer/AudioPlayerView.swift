//
//  AudioPlayerView.swift
//  MusicApp
//
//  Created by abhishek on 04/04/23.
//

import SwiftUI

struct AudioPlayerView: View {
    //MARK: - Properties
    @State private var isMinimised = false
    @State private var yoffSet : CGFloat = 0
    //MARK: - View Builder
    var body: some View {
        ZStack{
            Image("marcela-laskoski-YrtFlrLo2DQ-unsplash")
                .resizable()
                .scaledToFill()
                .opacity(0.78)
                .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height)
                .edgesIgnoringSafeArea(.top)

            VStack(alignment: .center,spacing: 30, content: {
                //:- Calling AudioScreenButtonsView to display buttons of mini player...
                AudioScreenButtons(buttonName: "heart")
                    .overlay(alignment: .topTrailing, content: {

                    }).padding(.zero)
                //:- Calling AudioImage to show image of song being played...
                AudioImageView()
                    .padding(.leading,30)
                    .padding(.trailing,30)
                    .padding(.bottom,-20)
                Text("Song-Name")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                //:- Calling SongDuration slider to show duration of song played...
                SongDurationSlider()
                HStack(alignment: .center,spacing: 80, content: {
                    //:- Calling AudioScreenButtonsView to display buttons of mini player...
                    AudioScreenButtons(buttonName: "backward.circle.fill")
                    AudioScreenButtons(buttonName: "play.circle.fill")
                    AudioScreenButtons(buttonName: "forward.circle.fill")
                })
                    //:- Padding for elements in Vstack
                    .padding(.bottom,70)
            })
        }
    }
}

struct AudioPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        AudioPlayerView()
    }
}
