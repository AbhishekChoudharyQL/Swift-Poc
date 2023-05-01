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
            
            VStack(spacing: 0){ // 100
                NavigationStack {
                    CardView()
                        .padding()
                    SlidingView()
                     }
                     .searchable(text: $searchText, prompt: "Look for something")
                     .navigationTitle("iInvest")
                     .background(Color.green)
                     .navigationBarHidden(false)
            }
        })
        
    }
}

 //MARK: - Previews
struct StocksView_Previews: PreviewProvider {
    static var previews: some View {
        StocksView()
    }
}

