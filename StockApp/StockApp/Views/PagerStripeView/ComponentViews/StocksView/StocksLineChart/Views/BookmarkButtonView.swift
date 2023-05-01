//
//  BookmarkButtonView.swift
//  StockApp
//
//  Created by abhishek on 01/05/23.
//

import SwiftUI

struct BookmarkButtonView: View {
    @Environment(\.managedObjectContext) private var managedContext
    var listChartModel : LineChartModel
     @State var isTapped : Bool = false
    var body: some View {
        HStack(){
            Spacer()
            Button{
                print("Bookmark")
                BookmarkDataModel().addStocks(name: listChartModel.name, currentPrice: listChartModel.currentPrice, context: managedContext)
                isTapped.toggle()
            } label: {
                Image(systemName: isTapped ? "bookmark.fill" : "bookmark")
                    .foregroundColor(.green)
                    .frame(width: 30)
                    .padding(.trailing,10)
            }
        }
    }
  
}

struct BookmarkButtonView_Previews: PreviewProvider {
    static var previews: some View {
        BookmarkButtonView(listChartModel: LineChartModel(priceValues: [142.0, 148.6, 181.3, 125.2, 149.9], name: "Spice Jet", currentPrice: 64.90, highestPrice: 81.60))
    }
}
