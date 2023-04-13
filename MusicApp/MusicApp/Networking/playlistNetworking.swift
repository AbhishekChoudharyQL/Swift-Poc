//
//  playlistNetworking.swift
//  MusicApp
//
//  Created by abhishek on 11/04/23.
//

import Foundation

class PlaylistApi : ObservableObject {
    @Published var playlist = [Playlist]()
    
    func getPlaylist() {
        let headers = [
            "X-RapidAPI-Key": "7ca238eddemshdabbbb187dde8e1p17372ejsn4c83797d547a",
            "X-RapidAPI-Host": "deezerdevs-deezer.p.rapidapi.com"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://deezerdevs-deezer.p.rapidapi.com/playlist/12")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error as Any)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse as Any)
            }
            if let data = data {
                do {
                    let jsonResponse = try JSONDecoder().decode(Playlist.self, from: data)
                    self.playlist.append(jsonResponse)
//                    self.playlist = jsonResponse
                    print(self.playlist)
                } catch  {
                    print(error)
                }
            }
        })

        dataTask.resume()
        
    }
}
