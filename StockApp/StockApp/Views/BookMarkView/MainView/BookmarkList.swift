//
//  BookmarkList.swift
//  StockApp
//
//  Created by abhishek on 27/04/23.
//

import SwiftUI

struct BookmarkList: View {
    @Environment(\.managedObjectContext) var managedContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.name)]) var stocks: FetchedResults<StockData>
    var body: some View {
        ZStack(content: {
           
            Form{
                Text("My Watch List")
                    .foregroundColor(.green)
                    .font(.custom("Italic", size: CGFloat(22)))
                    .bold()
                    .padding(.all,20)
                ForEach(stocks){
                    stock in
                    HStack(content: {
                        Text(stock.name!)
                            .padding()
                    
                        VStack(content: {
                            Text("Market Price")
                                .foregroundColor(.secondary)
                            currentPriceFormatter(currentPrice: stock.currentPrice)
                                .bold()
                        })
                        
                    })
                }

            }
        }).background(Color.red)
        
    }
    private func currentPriceFormatter(currentPrice: Double) -> Text {
        return Text("₹" + String(format: "%.2f", currentPrice))
    }
}

struct BookmarkList_Previews: PreviewProvider {
    static var previews: some View {
        BookmarkList()
    }
}

