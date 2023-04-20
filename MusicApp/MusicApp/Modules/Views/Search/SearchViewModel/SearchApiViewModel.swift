//
//  SearchApiViewModel.swift
//  MusicApp
//
//  Created by abhishek on 19/04/23.
//

import Foundation

class SearchApiViewModel : ObservableObject {
    //MARK: - Properties
    @Published var searchResult = [SearchData]()
    @Published var serchbrtext : String = ""
    @Published var ischanging = false

    //MARK: - Method to fetch search results using Api
    func getSearchResults(parameter: String){
        let headers = [
            "X-RapidAPI-Key": "7ca238eddemshdabbbb187dde8e1p17372ejsn4c83797d547a",
            "X-RapidAPI-Host": "deezerdevs-deezer.p.rapidapi.com"
        ]
         print(parameter)
        guard  let url = URL(string: "https://deezerdevs-deezer.p.rapidapi.com/search?q=\(parameter)") else {
            print("Cannot find url")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: {
            (data,response , error) -> Void in
            if (error != nil){
                print(error as Any)
            }
            else if let data = data {
                do {
                     let jsonResponse = try JSONDecoder().decode(SearchResult.self, from: data)
                        DispatchQueue.main.async{
//                            self.searchResult.append(jsonResponse)
                            self.searchResult = jsonResponse.data
                            print(self.searchResult)
                    }
                        
                } catch  {
                    print(error)
                }
            }
        })
        dataTask.resume()
    }
   
}
























