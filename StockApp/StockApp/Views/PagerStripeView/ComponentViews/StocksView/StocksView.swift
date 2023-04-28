//
//  StocksView.swift
//  StockApp
//
//  Created by abhishek on 27/04/23.
//

import SwiftUI

struct StocksView: View {
    
    //MARK: - Properties
    @State private var searchText = ""
    
    // MARK: - View Builder
    var body: some View {
        ZStack(content: {
            VStack(spacing: 100){
                NavigationStack {
                    CardView()
                        .padding()
                    SlidingView()
                     }
                     .searchable(text: $searchText, prompt: "Look for something")
            }
        })
        .background(Color.black)
    }
}

 //MARK: - Previews
struct StocksView_Previews: PreviewProvider {
    static var previews: some View {
        StocksView()
    }
}

