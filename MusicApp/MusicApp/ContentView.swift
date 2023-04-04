//
//  ContentView.swift
//  MusicApp
//
//  Created by abhishek on 03/04/23.
//

import SwiftUI
import AVKit

struct ContentView: View {
    var body: some View {
        VStack {
            HomeView()
            
        }
        .padding()
//        .onAppear(perform: {
//            playFromUrl()
//        })
    }
    
//    public func playFromUrl() {
//        let url = URL(string: "https://cdns-preview-d.dzcdn.net/stream/c-d764d438d8aec2cc5e1faa7ed5bff659-2.mp3")
//
//        let player = AVPlayer(url: url!)
//
//        player.play()
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
