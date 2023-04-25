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
    @State var sliderProgressValue : Double = 0
    @StateObject var audioPlayerViewModelForSlider : AudioPlayerViewModel
 

    //MARK: - View Builder
    var body: some View {
        VStack(content: {
            // 𝐑𝐞𝐮𝐬𝐚𝐛𝐥𝐞 𝐩𝐫𝐨𝐩𝐞𝐫𝐭𝐢𝐞𝐬 𝐨𝐟 𝐬𝐥𝐢𝐝𝐞𝐫 𝐟𝐨𝐫 𝐬𝐨𝐧𝐠 𝐝𝐮𝐫𝐚𝐭𝐢𝐨𝐧 ..
            Slider(value: $audioPlayerViewModelForSlider.sliderProgress,in: 0...30,onEditingChanged: {_ in
                    })
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width-100)
                    .accentColor(AppColor.lightColor)
         
        })
      }
    }

//MARK: - Previews
struct SongDurationSlider_Previews: PreviewProvider {
    static var previews: some View {
        SongDurationSlider( audioPlayerViewModelForSlider: AudioPlayerViewModel())
    }
}

