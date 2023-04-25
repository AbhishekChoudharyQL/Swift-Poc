//
//  SongNameTextModifier.swift
//  MusicApp
//
//  Created by abhishek on 12/04/23.
//

import SwiftUI
//MARK: - Enum
enum TextModifier {
    case AudioPlayerText
    case MiniplayerText
}
struct SongNameTextModifier: View {
 //MARK: - Properties
    var text : String
    var modifier : TextModifier
    
 //MARK: - View Builder
    var body: some View {
        switch modifier {
        case .AudioPlayerText:
            Text(text)
            .foregroundColor(.white)
            .font(.headline)
            .fontWeight(.bold)
            .padding()
        case .MiniplayerText:
            Text(text)
            .foregroundColor(.white)
            .fontDesign(.serif)
            .font(.custom("Helvitica", fixedSize: 25))
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
            .padding(.top)
            .padding(.leading,15)
        }
    }
}

 //MARK: - Previews
struct SongNameTextModifier_Previews: PreviewProvider {
    static var previews: some View {
        SongNameTextModifier(text: "Song-Name", modifier: .AudioPlayerText)
    }
}
