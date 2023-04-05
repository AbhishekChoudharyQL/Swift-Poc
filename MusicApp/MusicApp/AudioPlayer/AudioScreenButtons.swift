//
//  AudioScreenButton.swift
//  MusicApp
//
//  Created by abhishek on 04/04/23.
//

import SwiftUI

struct AudioScreenButtons: View {
    var buttonName : String = ""
    var body: some View {
        Button(action: {print("tapped")}, label: {
            Image(systemName: buttonName)
                .resizable()
                .frame(width: 50,height: 50)
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.white)
//                .background(.white)
        })
    }
}

struct AudioScreenButton_Previews: PreviewProvider {
    static var previews: some View {
        AudioScreenButtons()
    }
}
