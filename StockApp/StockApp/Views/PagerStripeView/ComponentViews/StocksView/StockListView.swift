//
//  StockListView.swift
//  StockApp
//
//  Created by abhishek on 28/04/23.
//

import SwiftUI

struct StockListView: View {
    
    //MARK: - Observed Properties
    @ObservedObject var stockViewModel = StocksViewModel()
    
    //MARK: - View Builder
    var body: some View {

        ZStack{
            NavigationView(content:{
                List{
                    ForEach(stockViewModel.stocksList,id: \.name) {
                        stockData in
                        NavigationLink(destination: LineChartView(priceValues: stockData.values,name: stockData.name!,currentPrice: stockData.current_price ?? 0.0)) {
                            HStack(content: {
                                if let name = stockData.name {
                                    Text(name)
                                }
                                Spacer()
                                    if let curentPrice = stockData.current_price{
                                        currentPriceFormatter(currentPrice: curentPrice)
                                }
                           })
                        }
                    }
                }
            })
            if stockViewModel.isLoading {
                       LoaderView()
                       }
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                stockViewModel.getStockData()
            }
      }
    }
    
    //MARK: - Private Methods
    private func currentPriceFormatter(currentPrice: Double) -> Text {
        return Text("₹" + String(format: "%.2f", currentPrice))
    }
}

   //MARK: - Previews
struct StockListView_Previews: PreviewProvider {
    static var previews: some View {
        StockListView()
    }
}
