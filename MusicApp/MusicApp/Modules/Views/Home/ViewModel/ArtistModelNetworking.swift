//
//  ArtistModelNetworking.swift
//  MusicApp
//
//  Created by abhishek on 10/04/23.
//

import Foundation
//
//class Networking : ObservableObject {
//    @Published var artists : [Artist] = []
//    
//    func getArtist() {
//        guard let url = URL(string: "https://api.jsonserve.com/A5rmJ5") else { return  }
//        let urlRequest =
//        URLRequest(url: url)
//        let datatask = URLSession.shared.dataTask(with: urlRequest){
//            (data,error,response) in
//            if let error = error {
//                print("Requested error:",error)
//                return
//            }
//            guard let response = response as? HTTPURLResponse else {return}
//            if response.statusCode == 200 {
//                guard let data = data else {return}
//                DispatchQueue.main.async {
//                    do {
//                        let jsonResponse = try JSONDecoder().decode([Artist].self, from: data)
//                        self.artists = jsonResponse
//                        print(self.artists)
//                    } catch  {
//                        print(error)
//                    }
//                }
//            }
//        }
//        datatask.resume()
//    }
//}
