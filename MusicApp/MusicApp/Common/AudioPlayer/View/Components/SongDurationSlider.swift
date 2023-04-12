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
        //:- Reusable properties of slider for song duration ..
        Slider(value: $sliderValue,in: 0...60)
            .frame(width: UIScreen.main.bounds.width-100)
            .accentColor(.init(red: 249/253, green: 125/253, blue: 218/253))
    }
}
//MARK: - Previews
struct SongDurationSlider_Previews: PreviewProvider {
    static var previews: some View {
        SongDurationSlider()
    }
}
