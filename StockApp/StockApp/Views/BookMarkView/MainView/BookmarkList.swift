//
//  BookmarkList.swift
//  StockApp
//
//  Created by abhishek on 27/04/23.
//

import SwiftUI

struct BookmarkList: View {
    
    //MARK: - Properties
    @Environment(\.managedObjectContext) var managedContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.name)]) var stocks: FetchedResults<StockData>
    
    //MARK: - View Builder
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
                          Spacer()
                        VStack(content: {
                            Text("Market Price")
                                .foregroundColor(.secondary)
                            currentPriceFormatter(currentPrice: stock.currentPrice)
                                .bold()
                        })
                    })
                }.onDelete(perform: deleteStock)
            }.formStyle(.grouped)
        })
    }
    
    //MARK: - Private Methods
    private func currentPriceFormatter(currentPrice: Double) -> Text {
        return Text("\u{20B9}" + String(format: "%.2f", currentPrice))
    }
    private func deleteStock(offset: IndexSet){
        withAnimation {
            offset.map{stocks[$0]}.forEach(managedContext.delete)
            BookmarkDataModel().save(Context: managedContext)
        }
    }
}

 //MARK: - Previews
struct BookmarkList_Previews: PreviewProvider {
    static var previews: some View {
        BookmarkList()
    }
}

