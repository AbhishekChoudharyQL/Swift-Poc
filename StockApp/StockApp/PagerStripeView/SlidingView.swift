//
//  SlidingView.swift
//  StockApp
//
//  Created by abhishek on 28/04/23.
//

import SwiftUI
import SlidingTabView

struct SlidingView: View {
    @State private var tabIndex = 0
    var body: some View {
        VStack {
            SlidingTabView(selection: $tabIndex,
                         tabs: ["Explore","Stocks","Orders"],
                         animation: .easeInOut,activeAccentColor: .green,
                          selectionBarColor: .green)
                  Spacer()
            if tabIndex == 0 {
                ExploreView()
            }
            else if tabIndex == 1 {
                OrderView()
            }
            else if tabIndex == 2 {
                StockListView()
            }
            Spacer()
        }
        .padding()
    }
}

struct SlidingView_Previews: PreviewProvider {
    static var previews: some View {
        SlidingView()
    }
}
