//
//  AudioScreenButton.swift
//  MusicApp
//
//  Created by abhishek on 04/04/23.
//

import SwiftUI

struct AudioScreenButtons: View {
   //MARK: - Properties
    var buttonName : String = ""
    //MARK: - View Builder
    var body: some View {
        //:- Reusable button properties
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
//MARK: - Previews
struct AudioScreenButton_Previews: PreviewProvider {
    static var previews: some View {
        AudioScreenButtons()
    }
}
