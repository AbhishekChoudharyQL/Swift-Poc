//
//  ArtistApi.swift
//  MusicApp
//
//  Created by abhishek on 13/04/23.
//

import Foundation

class ArtistApi : ObservableObject {
    @Published var artists = [Artist]()
    let artistIds = [13, 27, 54, 81, 112, 122, 142, 167]

    func getArtists(ids: [Int], completion: @escaping () -> ()) {
        let headers = [
            "X-RapidAPI-Key": "7ca238eddemshdabbbb187dde8e1p17372ejsn4c83797d547a",
            "X-RapidAPI-Host": "deezerdevs-deezer.p.rapidapi.com"
        ]

        let session = URLSession.shared
        
        var count = 0 // to keep track of how many requests have been completed
        
        for id in artistIds {
            let request = NSMutableURLRequest(url: NSURL(string: "https://deezerdevs-deezer.p.rapidapi.com/artist/\(id)")! as URL,
                                              cachePolicy: .useProtocolCachePolicy,
                                              timeoutInterval: 10.0)
            request.httpMethod = "GET"
            request.allHTTPHeaderFields = headers
            
            let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
                if let error = error {
                    print(error)
                } else if let data = data {
                    do {
                        let jsonResponse = try JSONDecoder().decode(Artist.self, from: data)
                        DispatchQueue.main.async{
                            self.artists.append(jsonResponse)
                        }
                        // increment count and check if all requests have completed
                        count += 1
                        if count == ids.count {
                            completion()
                        }
                    } catch  {
                        print(error)
                    }
                }
            })

            dataTask.resume()
        }
    }
}
