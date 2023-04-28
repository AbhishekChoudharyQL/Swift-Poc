//
//  StocksView.swift
//  StockApp
//
//  Created by abhishek on 27/04/23.
//

import SwiftUI

struct StocksView: View {
    @State private var searchText = ""
    var body: some View {
        ZStack(content: {
            VStack(spacing: 100){
                NavigationStack {
                    CardView()
                        .padding()
//                         PagerView()
//                    List{
//                        Group{
//                            Text("Amazon")
//                            Text("Microsoft")
//                            Text("Tesla")
//                            Text("Facebook")
//                        }
//                        Group{
//                            Text("Netflix")
//                            Text("gjkgj")
//                            Text("Teslgfva")
//                            Text("Facebgjfhook")
//                        }
//                        Group{
//                            Text("Netflix23")
//                            Text("gjkgjhg78")
//                            Text("Teslgfva452")
//                            Text("Facebgjfhook238")
//                        }
//
//                    }
//                    TopTabBar()
                    SlidingView()
                     }
                     .searchable(text: $searchText, prompt: "Look for something")
            }
        })
        .background(Color.black)
    }
}

struct StocksView_Previews: PreviewProvider {
    static var previews: some View {
        StocksView()
    }
}

