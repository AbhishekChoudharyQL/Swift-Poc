//
//  SearchApi.swift
//  MusicApp
//
//  Created by abhishek on 16/04/23.
//

import Foundation

class SearchApi : ObservableObject {
    @Published var searchResult = [SearchResult]()
    
    @Published var serchbrtext : String = ""
    
    func getSearchResults(parameter: String){
        let headers = [
            "X-RapidAPI-Key": "7ca238eddemshdabbbb187dde8e1p17372ejsn4c83797d547a",
            "X-RapidAPI-Host": "deezerdevs-deezer.p.rapidapi.com"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://deezerdevs-deezer.p.rapidapi.com/search?q=\(parameter)")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: {
            (data,error ,response) -> Void in
            if (error != nil){
                print(error as Any)
            }
            else if let data = data {
                do {
                     let jsonResponse = try JSONDecoder().decode(SearchResult.self, from: data)
                        DispatchQueue.main.async{
                            self.searchResult.append(jsonResponse)
//                            print(self.searchResult)
                    }
                        
                } catch  {
                    print(error)
                }
            }
        })
        dataTask.resume()
    }
}
