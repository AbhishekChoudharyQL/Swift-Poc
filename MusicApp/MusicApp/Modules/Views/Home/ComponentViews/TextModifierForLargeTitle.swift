//
//  TextModifierHomeScreen.swift
//  MusicApp
//
//  Created by abhishek on 17/04/23.
//

import SwiftUI

struct TextModifierForLargeTitle: View {
    var text : String
    var body: some View {
        Text(text)
            .foregroundColor(Color.white)
            .font(.title2)
            .bold()
    }
}

struct TextModifierHomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        TextModifierForLargeTitle(text: "")
    }
}
