//
//  TextModifierHomeScreen.swift
//  MusicApp
//
//  Created by abhishek on 17/04/23.
//

import SwiftUI

struct TextModifierForLargeTitle: View {
    //MARK: - Properties
    var text : String
    
    //MARK: - View Builder
    var body: some View {
        Text(text)
            .foregroundColor(Color.white)
            .font(.title2)
            .bold()
    }
}

 //MARK: - Previews
struct TextModifierHomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        TextModifierForLargeTitle(text: "")
    }
}
