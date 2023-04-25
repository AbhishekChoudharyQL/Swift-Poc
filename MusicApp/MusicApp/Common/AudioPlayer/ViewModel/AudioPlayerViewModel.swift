//
//  AudioPlayerViewModel.swift
//  MusicApp
//
//  Created by abhishek on 21/04/23.
//
//https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3
//https://cdns-preview-8.dzcdn.net/stream/c-831730343d351794fd0a464a6d9b22c8-5.mp3
//import Foundation
//import AVFoundation
//import AVFAudio
//
//enum PlayerState {
//    case isPlaying
//    case isPaused
//}
//
//class AudioPlayerViewModel : ObservableObject {
//
//    //MARK: - Properties
//    @Published var currentSongUrl : String = ""
//    @Published var playerState : PlayerState = .isPaused
//    @Published var songTitle : String = ""
//    @Published var audioPlayer : AVPlayer?
//    @Published var sliderProgress = 0.0
//
//
//    //MARK: - Public Methods
//    func setupAudio(){
//        switch playerState {
//        case .isPlaying:
//            pauseAudio()
//        case .isPaused:
//            playAudio()
//        }
//    }
//
//    //MARK: - Private Methods
//    private func playAudio(){
//        print(currentSongUrl)
//        if let url = URL(string: currentSongUrl){
//            audioPlayer = AVPlayer(url: url)
//            audioPlayer?.play()
//            setupSlider()
//            playerState = .isPlaying
//
//        }
//    }
//
//     private func pauseAudio(){
//         audioPlayer?.pause()
//         playerState = .isPaused
//
//    }
//
//    func setupSlider(){
//        audioPlayer?.addPeriodicTimeObserver(forInterval: CMTimeMake(value: 1, timescale: 1), queue: .main){
//            time in
//            let fraction = Double(CMTimeGetSeconds(time))
//            self.sliderProgress = fraction
////            self.sliderProgress = String(format: "%2f", fraction)
//
//        }
//
//    }
//
//}
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
    @Published var currentSongUrl: String = ""
    @Published var playerState: PlayerState = .isPaused
    @Published var songTitle: String = ""
    @Published var audioPlayer: AVPlayer?
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    private let audioSession = AVAudioSession.sharedInstance()
    //MARK: - Public Methods
    func setupAudio(){
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
    
    func pauseAudio(){
        audioPlayer?.pause()
        playerState = .isPaused
    }
    private func setupAudioSession() {
        do {
            try audioSession.setCategory(.playback, mode: .default)
            try audioSession.setActive(true)
        } catch {
            print("Error setting up audio session: \(error.localizedDescription)")
        }
    }
    
    private func teardownAudioSession() {
        do {
            try audioSession.setActive(false)
        } catch {
            print("Error tearing down audio session: \(error.localizedDescription)")
        }
    }

}

