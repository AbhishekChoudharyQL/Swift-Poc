//
//  FloatingViewModel.swift
//  MusicApp
//
//  Created by abhishek on 20/04/23.
//

import Foundation

class FloatingAudioPlayerViewModel : ObservableObject {
    @Published var currentSongUrl : String = ""
    @Published var previousSongUrl : String = ""
    @Published var nextSongUrl : String = ""
    @Published var isPlaying = false
    @Published var isPaused = true
}

