//
//  AudioPlayerView.swift
//  MusicApp
//
//  Created by abhishek on 04/04/23.
//

import SwiftUI



struct AudioPlayerView: View {
    //MARK: - Properties
    @StateObject var audioPlayerViewModel : AudioPlayerViewModel
    
    //MARK: - View Builder
    var body: some View {
        ZStack{
            VStack(alignment: .center, spacing: 0, content: {
                HStack(alignment: .bottom,content: {
                    Spacer()
                    AudioScreenButtons(buttonName: "heart", buttonAction: {
                    })
                })
                .padding(.top,10)
                AudioImageView()
                    .padding(.leading,30)
                    .padding(.trailing,30)
                    .padding(.bottom,-10)
                SongNameTextModifier(text: audioPlayerViewModel.songTitle, modifier: .AudioPlayerText)
                SongDurationSlider(audioPlayerViewModelForSlider: audioPlayerViewModel)
                    .padding(.bottom,40)
                audioPlayerButtonFunctions()
                .padding()
            })
            .frame(width: UIScreen.main.bounds.width,height:UIScreen.main.bounds.height)
            .padding()
        }.background(AppColor.backgroundColor)
    }

    //MARK: - Resuable Method to show buttons and perform audio actions on buttons
     func audioPlayerButtonFunctions() -> some View {
        return HStack(alignment: .center,spacing: 80, content: {
            AudioScreenButtons(buttonName: "backward.circle.fill", buttonAction: {
            })
            AudioScreenButtons(buttonName: audioPlayerViewModel.playerState == .isPaused ? "play.circle.fill" :"pause.circle.fill",buttonAction: {
//                print("Updating state to play preview")
                audioPlayerViewModel.setupAudio()
            })
            AudioScreenButtons(buttonName: "forward.circle.fill", buttonAction: {
            })
        })
    }
}

//MARK: - Previews
struct AudioPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        AudioPlayerView(audioPlayerViewModel: AudioPlayerViewModel())
    }
}
