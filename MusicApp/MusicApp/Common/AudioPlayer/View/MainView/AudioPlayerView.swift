//
//  AudioPlayerView.swift
//  MusicApp
//
//  Created by abhishek on 04/04/23.
//

import SwiftUI



struct AudioPlayerView: View {
    //MARK: - Properties
//    @State private var yoffSet : CGFloat = 0
    @ObservedObject var audioPlayerViewModel = AudioPlayerViewModel()
    @State var isPlaying = false
    
    //MARK: - View Builder
    var body: some View {
        ZStack{
            VStack(alignment: .center, spacing: 10, content: {
                HStack(alignment: .center,content: {
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
                audioPlayerViewModel.playSound(sound: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3")
            }
    }
    
    //MARK: - Resuable Method to show buttons and perform actions on buttons
    fileprivate func audioPlayerButtonFunctions() -> HStack<TupleView<(AudioScreenButtons, some View, AudioScreenButtons)>> {
        return HStack(alignment: .center,spacing: 80, content: {
            AudioScreenButtons(buttonName: "backward.circle.fill")
            AudioScreenButtons(buttonName: isPlaying ? "pause.circle.fill" : "play.circle.fill")
                .onTapGesture {
                    audioPlayerViewModel.playSound(sound: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3")
                    isPlaying.toggle()
                    if isPlaying {
                        audioPlayerViewModel.audioPlayer?.play()
                    }
                    else {
                        audioPlayerViewModel.audioPlayer?.pause()
                    }
                }
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
