//
//  playlistNetworking.swift
//  MusicApp
//
//  Created by abhishek on 11/04/23.
//

import Foundation

//class PlaylistNetworking: ObservableObject {
//@Published var playlistData = [PlaylistResponse]()
//
//func getPlaylistData() {
//    guard let url = URL(string: "https://api.deezer.com/chart/0/playlists?limit=16") else {
//        print("NO URL")
//        return
//    }
//    URLSession.shared.dataTask(with: url, completionHandler: { data, error, response in
//        if let data = data {
//            do {
//                let jsonResponse = try JSONDecoder().decode(PlaylistResponse.self, from: data)
//                DispatchQueue.main.async {
//                    self.playlistData.append(jsonResponse)
//                    print(self.playlistData)
//                }
//            } catch {
//                print("catched-error: \(error)")
//            }
//        }
//    }).resume()
//}
//}
