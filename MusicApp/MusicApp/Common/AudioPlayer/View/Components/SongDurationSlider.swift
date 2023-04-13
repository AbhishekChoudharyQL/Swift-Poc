//
//  SongDurationSlider.swift
//  MusicApp
//
//  Created by abhishek on 04/04/23.
//

import SwiftUI

struct SongDurationSlider: View {
    //MARK: - Properties
    @State var sliderValue : Double = 0.0
    //MARK: - View Builder
    var body: some View {
        // 𝐑𝐞𝐮𝐬𝐚𝐛𝐥𝐞 𝐩𝐫𝐨𝐩𝐞𝐫𝐭𝐢𝐞𝐬 𝐨𝐟 𝐬𝐥𝐢𝐝𝐞𝐫 𝐟𝐨𝐫 𝐬𝐨𝐧𝐠 𝐝𝐮𝐫𝐚𝐭𝐢𝐨𝐧 ..
        Slider(value: $sliderValue,in: 0...60)
            .frame(width: UIScreen.main.bounds.width-100)
            .accentColor(AppColor.lightColor)
    }
}
//MARK: - Previews
struct SongDurationSlider_Previews: PreviewProvider {
    static var previews: some View {
        SongDurationSlider()
    }
}
