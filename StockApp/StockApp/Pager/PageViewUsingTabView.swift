//
//  PageViewUsingTabView.swift
//  StockApp
//
//  Created by abhishek on 27/04/23.
//
// https://api.jsonserve.com/q9hdYs
import SwiftUI

struct PageViewUsingTabView: View {
    var body: some View {
        TabView {
                    Text("Explore")
                    Text("Recomended")
                
                }
                .tabViewStyle(.page)
    }
}

struct PageViewUsingTabView_Previews: PreviewProvider {
    static var previews: some View {
        PageViewUsingTabView()
    }
}
