//
//  BookmarkButtonView.swift
//  StockApp
//
//  Created by abhishek on 01/05/23.
//

import SwiftUI

struct BookmarkButtonView: View {
    
    //MARK: - Properties
    @Environment(\.managedObjectContext) private var managedContext
    @State var listChartModel : LineChartModel
    
    //MARK: - View Builder
    var body: some View {
        HStack(){
            Spacer()
            Button{
                print("Bookmark")
                listChartModel.isBookmarked.toggle()
                if listChartModel.isBookmarked == true {
                    BookmarkDataModel().addStocks(name: listChartModel.name, currentPrice: listChartModel.currentPrice, context: managedContext)
                }
            } label: {
                Image(systemName: listChartModel.isBookmarked ? "bookmark.fill" : "bookmark")
                    .foregroundColor(.green)
                    .frame(width: 30)
                    .padding(.trailing,10)
            }
        }
    }
}

  //MARK: - Previews
struct BookmarkButtonView_Previews: PreviewProvider {
    static var previews: some View {
        BookmarkButtonView(listChartModel: LineChartModel(priceValues: [142.0, 148.6, 181.3, 125.2, 149.9], isBookmarked: false, name: "Spice Jet", currentPrice: 64.90, highestPrice: 81.60))
    }
}
