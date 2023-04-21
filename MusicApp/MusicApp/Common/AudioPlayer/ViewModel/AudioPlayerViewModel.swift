//
//  AudioPlayerViewModel.swift
//  MusicApp
//
//  Created by abhishek on 21/04/23.
//

import Foundation
import AVFoundation
import AVFAudio

class AudioPlayerViewModel : ObservableObject {
    
    //MARK: - Properties
    @Published var currentSongUrl : String = ""
    @Published var previousSongUrl : String = ""
    @Published var nextSongUrl : String = ""
    var audioPlayer : AVPlayer?
    
    //MARK: -  Methods
   func playSound(sound: String){
        if let url = URL(string: sound){
            self.audioPlayer = AVPlayer(url: url)
        }
    }
}
