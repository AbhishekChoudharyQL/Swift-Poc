//
//  AudioPlayerViewModel.swift
//  MusicApp
//
//  Created by abhishek on 21/04/23.
//
//https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3
//https://cdns-preview-8.dzcdn.net/stream/c-831730343d351794fd0a464a6d9b22c8-5.mp3
import Foundation
import AVFoundation
import AVFAudio

enum PlayerState {
    case isPlaying
    case isPaused
}

class AudioPlayerViewModel : ObservableObject {

    //MARK: - Properties
    @Published var currentSongUrl : String = "https://cdns-preview-8.dzcdn.net/stream/c-831730343d351794fd0a464a6d9b22c8-5.mp3"
//    @Published var previousSongUrl : String = ""
//    @Published var nextSongUrl : String = ""
    @Published var playerState : PlayerState = .isPaused
    @Published var songTitle : String = ""
    var audioPlayer : AVPlayer?

    //MARK: - Public Methods
    func setupAudio(){
        print(playerState)
        print(songTitle)
        switch playerState {
        case .isPlaying:
            pauseAudio()
        case .isPaused:
            playAudio()
        }
    }

    //MARK: - Private Methods
    private func playAudio(){
        print(currentSongUrl)
        if let url = URL(string: currentSongUrl){
            audioPlayer = AVPlayer(url: url)
            audioPlayer?.play()
            playerState = .isPlaying
        }
    }
     private func pauseAudio(){
         audioPlayer?.pause()
         playerState = .isPaused
    }
}
