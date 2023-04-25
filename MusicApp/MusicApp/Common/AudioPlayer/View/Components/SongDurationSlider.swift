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
//    @State var sliderValue : Double = 0.0
    @State var sliderProgressValue : Double = 0
    @StateObject var audioPlayerViewModelForSlider : AudioPlayerViewModel
    let maxDuration = 30.00
    let timer = Timer.publish(every: 1.0, on: .main, in: .common)
        .autoconnect()

    //MARK: - View Builder
    var body: some View {
        VStack(content: {
            // 𝐑𝐞𝐮𝐬𝐚𝐛𝐥𝐞 𝐩𝐫𝐨𝐩𝐞𝐫𝐭𝐢𝐞𝐬 𝐨𝐟 𝐬𝐥𝐢𝐝𝐞𝐫 𝐟𝐨𝐫 𝐬𝐨𝐧𝐠 𝐝𝐮𝐫𝐚𝐭𝐢𝐨𝐧 ..
                    Slider(value: $sliderProgressValue,in: 0...30,onEditingChanged: {_ in
                    })
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width-100)
                    .accentColor(AppColor.lightColor)
            HStack(content: {
                let formatter = String(format: "%.2f", sliderProgressValue)
                Text("0.00")
                .padding(.leading,40)
                Spacer()
                Text("00.30")
                .padding(.trailing,40)
            }).foregroundColor(.white)
            if audioPlayerViewModelForSlider.playerState == .isPlaying{
                let timer = audioPlayerViewModelForSlider.audioPlayer?.addPeriodicTimeObserver(forInterval: CMTime(seconds: 1, preferredTimescale: CMTimeScale(NSEC_PER_SEC)), queue: DispatchQueue.main){ (time) in
                    self.sliderProgressValue = Double(CMTimeGetSeconds(time))
                    
                }
            }
          
        })
      }
    }


//MARK: - Previews
struct SongDurationSlider_Previews: PreviewProvider {
    static var previews: some View {
        SongDurationSlider( audioPlayerViewModelForSlider: AudioPlayerViewModel())
    }
}
