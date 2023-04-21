//
//  AudioPlayerViewModel.swift
//  MusicApp
//
//  Created by abhishek on 21/04/23.
//

import Foundation
import AVFoundation
import AVFAudio

enum PlayerState {
    case isPlaying
    case isPaused
}

class AudioPlayerViewModel : ObservableObject {
    
    //MARK: - Properties
    @Published var currentSongUrl : String = "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3"
    @Published var previousSongUrl : String = ""
    @Published var nextSongUrl : String = ""
    @Published var playerState : PlayerState = .isPaused
    var audioPlayer : AVPlayer?
    
    //MARK: - Public Methods
    func setupAudio(){
        switch playerState {
            
        case .isPlaying:
            pauseAudio()
        case .isPaused:
            playAudio()
            playerState = .isPlaying
        }
    }
    
    //MARK: - Private Methods
    private func playAudio(){
        if let url = URL(string: currentSongUrl){
            audioPlayer = AVPlayer(url: url)
            audioPlayer?.play()
        }
    }
     private func pauseAudio(){
        audioPlayer?.pause()
    }
    
}
