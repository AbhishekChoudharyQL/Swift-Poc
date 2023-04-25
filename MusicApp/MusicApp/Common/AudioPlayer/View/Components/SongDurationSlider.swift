//
//  SongDurationSlider.swift
//  MusicApp
//
//  Created by abhishek on 04/04/23.
//

import SwiftUI
import CoreMedia

struct SongDurationSlider: View {
    //MARK: - Properties
    @State var sliderProgressValue: Double = 0
    @StateObject var audioPlayerViewModelForSlider: AudioPlayerViewModel
    let maxDuration = 30.0
    
    var body: some View {
        VStack(content: {
            Slider(value: $sliderProgressValue, in: 0...maxDuration)
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width-100)
                .accentColor(AppColor.lightColor)
                .onReceive(audioPlayerViewModelForSlider.timer) { _ in
                    if audioPlayerViewModelForSlider.playerState == .isPlaying {
                        if sliderProgressValue < maxDuration {
                            sliderProgressValue += 1.0
                        } else {
                            sliderProgressValue = 0
                            audioPlayerViewModelForSlider.pauseAudio()
                        }
                    }
                }
            HStack(content: {
                Text("00.00")
                    .foregroundColor(.white)
                    .padding(.leading,15)
                Spacer()
                Text("00.30")
                    .foregroundColor(.white)
                    .padding(.trailing,15)
            }).padding(.bottom,20)
        })
    }
}
//MARK: - Previews
struct SongDurationSlider_Previews: PreviewProvider {
    static var previews: some View {
        SongDurationSlider( audioPlayerViewModelForSlider: AudioPlayerViewModel())
    }
}


