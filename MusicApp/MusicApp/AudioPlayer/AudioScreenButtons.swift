//
//  AudioScreenButton.swift
//  MusicApp
//
//  Created by abhishek on 04/04/23.
//
//UIScreen.main.bounds.width*0.09
//UIScreen.main.bounds.height*0.05
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
//                .frame(width: 50,height: 50)
                .frame(width: 35,height: 30)
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
