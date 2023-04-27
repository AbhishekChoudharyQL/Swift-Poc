//
//  StocksViewModel.swift
//  StockApp
//
//  Created by abhishek on 27/04/23.
//

import Foundation

class StocksViewModel : ObservableObject {
    @Published var stocksList : [StocksModel] = []
    
//    func getStockData() {
//        let url = URL(string: "https://api.jsonserve.com/q9hdYs")
//        let urlRequest = URLRequest(url: url)
//        let dataTask = URLSession.shared.dataTask(with: urlRequest, completionHandler: {
//            data ,response , url in
//            if let data = data {
//                do {
//                    let jsonResponse = JSONDecoder().decode(StocksModel, from: data)
//                    self .stocksList = jsonResponse
//                } catch  {
//                    print("Error caught while catching error")
//                }
//            }
//        })
//    }
    
    
}
