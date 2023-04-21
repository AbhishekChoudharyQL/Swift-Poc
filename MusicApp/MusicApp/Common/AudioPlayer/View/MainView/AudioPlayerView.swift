//
//  AudioPlayerView.swift
//  MusicApp
//
//  Created by abhishek on 04/04/23.
//

import SwiftUI



struct AudioPlayerView: View {
    //MARK: - Properties
    @StateObject var audioPlayerViewModel = AudioPlayerViewModel()
    @State var isPlaying = false
    
    //MARK: - View Builder
    var body: some View {
        ZStack{
            VStack(alignment: .center, spacing: 10, content: {
                HStack(alignment: .bottom,content: {
                    Spacer()
                    AudioScreenButtons(buttonName: "heart")
                })
                .padding(.top,10)
                AudioImageView()
                    .padding(.leading,30)
                    .padding(.trailing,30)
                    .padding(.bottom,-10)
                SongNameTextModifier(text: "Song-Name", modifier: .AudioPlayerText)
                SongDurationSlider()
                audioPlayerButtonFunctions()
                .padding()
            })
            .frame(width: UIScreen.main.bounds.width,height:UIScreen.main.bounds.height)
            .padding()
        }.background(AppColor.backgroundColor)
            .onAppear{
                print("Calling view model")
                audioPlayerViewModel.setupAudio()
            }
    }

    //MARK: - Resuable Method to show buttons and perform actions on buttons
    fileprivate func audioPlayerButtonFunctions() -> some View {
        print("Method called")

        return HStack(alignment: .center,spacing: 80, content: {
            AudioScreenButtons(buttonName: "backward.circle.fill")
            AudioScreenButtons(buttonName: audioPlayerViewModel.playerState == .isPaused ? "play.circle.fill" :"pause.circle.fill",buttonAction: {
                if audioPlayerViewModel.playerState == .isPaused {
                        audioPlayerViewModel.setupAudio()
//                        audioPlayerViewModel.playerState = .isPlaying
                } else if audioPlayerViewModel.playerState == .isPlaying {
                        audioPlayerViewModel.setupAudio()
//                        audioPlayerViewModel.playerState = .isPaused
                    }
            })
            AudioScreenButtons(buttonName: "forward.circle.fill")
        })
    }
}

//MARK: - Previews
struct AudioPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        AudioPlayerView()
    }
}
