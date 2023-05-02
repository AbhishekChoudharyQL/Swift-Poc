//
//  SlidingView.swift
//  StockApp
//
//  Created by abhishek on 28/04/23.
//

import SwiftUI
import SlidingTabView

struct SlidingView: View {
    
    //MARK: - Properties
    @State private var tabIndex = 0
    
    //MARK: - View Builder
    var body: some View {
        VStack {
            SlidingTabView(selection: $tabIndex,
                 tabs: ["Explore","Stocks","Orders"],
                 animation: .easeInOut,activeAccentColor: .green,
                  selectionBarColor: .green)
                  Spacer()
            slidingTabSelector()
            Spacer()
        }
    }
    
    //MARK: - Private Methods
    private func slidingTabSelector() ->  some View {
        switch tabIndex {
        case 0 :
            return AnyView(ExploreView())
        case 1 :
            return AnyView(StockListView())
        default:
            return AnyView(OrderView())
        }
    }
}

  //MARK: - Previews
struct SlidingView_Previews: PreviewProvider {
    static var previews: some View {
        SlidingView()
    }
}
