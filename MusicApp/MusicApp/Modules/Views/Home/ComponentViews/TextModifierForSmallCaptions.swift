//
//  TextModifierForSmallCaptions.swift
//  MusicApp
//
//  Created by abhishek on 17/04/23.
//

import SwiftUI

struct TextModifierForSmallCaptions: View {
    //MARK: - Properties
    var texttoBeModified : String
    
    //MARK: - View Builder
    var body: some View {
       Text(texttoBeModified)
            .font(.caption)
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
      }
  }

  //MARK: - Previews
struct TextModifierForSmallCaptions_Previews: PreviewProvider {
    static var previews: some View {
        TextModifierForSmallCaptions(texttoBeModified: "")
    }
}
