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
    var buttonAction : () -> ()
    
    //MARK: - View Builder
    var body: some View {
        // 𝐑𝐞𝐮𝐬𝐚𝐛𝐥𝐞 𝐛𝐮𝐭𝐭𝐨𝐧 𝐩𝐫𝐨𝐩𝐞𝐫𝐭𝐢𝐞𝐬..
        Button(action: {buttonAction()},
            label: {
            Image(systemName: buttonName)
                .resizable()
                .frame(width: 35,height: 35)
                .aspectRatio(contentMode: .fit)
                .foregroundColor(AppColor.lightColor)          
        })
    }
}

//MARK: - Previews
struct AudioScreenButton_Previews: PreviewProvider {
    static var previews: some View {
        AudioScreenButtons(buttonAction: {
            
        })
    }
}
