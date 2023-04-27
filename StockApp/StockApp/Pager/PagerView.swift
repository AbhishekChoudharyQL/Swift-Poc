//
//  PagerView.swift
//  StockApp
//
//  Created by abhishek on 27/04/23.
//

import SwiftUI

struct PagerView: View {
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            HStack{
                PagerComponent(pagerTitle: "Explore")
                PagerComponent(pagerTitle: "Recommended")
            }
         
        }
     
    }
}

struct PagerView_Previews: PreviewProvider {
    static var previews: some View {
        PagerView()
    }
}
