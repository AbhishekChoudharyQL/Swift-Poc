//
//  DummyView.swift
//  StockApp
//
//  Created by abhishek on 28/04/23.
//

import SwiftUI

struct DummyView: View {
    var body: some View {
        ZStack{
            VStack{
            Text("Dummy View")
                TabBarManager(selectedTab: .bookmark)
            }
        }.background(Color.blue)
    }
}

struct DummyView_Previews: PreviewProvider {
    static var previews: some View {
        DummyView()
    }
}
