//
//  TextModifierForSmallCaptions.swift
//  MusicApp
//
//  Created by abhishek on 17/04/23.
//

import SwiftUI

struct TextModifierForSmallCaptions: View {
    var texttoBeModified : String
    var body: some View {
       Text(texttoBeModified)
            .font(.caption)
            .foregroundColor(.white)
    }
}

struct TextModifierForSmallCaptions_Previews: PreviewProvider {
    static var previews: some View {
        TextModifierForSmallCaptions(texttoBeModified: "")
    }
}
