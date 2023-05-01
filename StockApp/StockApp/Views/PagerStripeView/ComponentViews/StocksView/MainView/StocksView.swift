//
//  StocksView.swift
//  StockApp
//
//  Created by abhishek on 27/04/23.
//

import SwiftUI

struct StocksView: View {
    
    //MARK: - Properties
    @State var searchText = ""
    
    // MARK: - View Builder
    var body: some View {
        ZStack(content: {
            VStack(spacing: 0){ // 100
            NavigationStack {
                VStack(content: {
                    CardView()
                        .padding()
                    SlidingView()
                })
                 }.searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Look for something")
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

