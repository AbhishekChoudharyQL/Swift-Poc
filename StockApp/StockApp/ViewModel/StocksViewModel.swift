//
//  StocksViewModel.swift
//  StockApp
//
//  Created by abhishek on 27/04/23.
//https://api.jsonserve.com/q9hdYs

import Foundation

class StocksViewModel : ObservableObject {
    
    //MARK: - Published Properties
    @Published var stocksList : [Stocks] = []
    @Published var isLoading : Bool = true
    //MARK: - Method to get stock data
    func getStockData() {
        guard let url = URL(string: "https://api.jsonserve.com/ps3H4N") else { return  }
        let urlRequest = URLRequest(url: url)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: urlRequest as URLRequest, completionHandler: {
            data , response , error in
            if error != nil {
                print(error as Any)
            }
            guard let data = data else{
                print("data is not found")
                return
            }
            do {
                let jsonResponse = try JSONDecoder().decode(StocksModel.self, from: data)
                DispatchQueue.main.async {
                    self.stocksList = jsonResponse.stocks
                }
            } catch  {
                print("Error caught")
            }
        })
        dataTask.resume()
        isLoading = false
    }
    
}
