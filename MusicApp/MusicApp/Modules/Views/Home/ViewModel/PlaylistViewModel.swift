//
//  PlaylistViewModel.swift
//  MusicApp
//
//  Created by abhishek on 17/04/23.
//

import Foundation
import SwiftUI

class PlaylistViewModel : ObservableObject {
    @Published var playlistData = [PlaylistResponse]()
    @Published var playlistData1 = [PlaylistResponse]()
    @Published var playlistData2 = [PlaylistResponse]()

    func getPlaylistData() {
        guard let url = URL(string: "https://api.deezer.com/chart/0/playlists?limit=16") else {
            print("NO URL")
            return 
        }
        URLSession.shared.dataTask(with: url, completionHandler: { data, error, response in
        if let data = data {
            do {
                let jsonResponse = try JSONDecoder().decode(PlaylistResponse.self, from: data)
                DispatchQueue.main.async {
                    self.playlistData.append(jsonResponse)
//                        print(self.playlistData)
                    if self.playlistData.count % 2 == 0 {
                         self.playlistData1 = Array(self.playlistData[0..<self.playlistData.count/2])
                         self.playlistData2 = Array(self.playlistData[self.playlistData.count/2..<self.playlistData.count])
                     } else {
                         self.playlistData1 = Array(self.playlistData[0..<self.playlistData.count/2+1])
                         self.playlistData2 = Array(self.playlistData[self.playlistData.count/2+1..<self.playlistData.count])
                     }
//                    print(self.playlistData1)
                  }
               }    catch {
                  print("catched-error: \(error)")
               }
            }
        }).resume()
    }
//    func divideIntoArray() {
//        ForEach(0..<playlistData.count) {
//            index in
//            if(index%2==0){
//                playlistData1 = playlistData[index]
//            }
//            else {
//                playlistData2 = playlistData[index]
//            }
//        }
//    }
    }

