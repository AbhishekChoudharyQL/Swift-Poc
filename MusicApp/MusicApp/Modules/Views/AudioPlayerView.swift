//
//  AudioPlayerView.swift
//  MusicApp
//
//  Created by abhishek on 04/04/23.
//

import SwiftUI

struct AudioPlayerView: View {
    var body: some View {
        ZStack{
            Image("marcela-laskoski-YrtFlrLo2DQ-unsplash")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
        }
        
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct AudioPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        AudioPlayerView()
    }
}
