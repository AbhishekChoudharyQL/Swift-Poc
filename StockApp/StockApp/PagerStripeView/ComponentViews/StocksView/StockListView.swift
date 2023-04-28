//
//  StockListView.swift
//  StockApp
//
//  Created by abhishek on 28/04/23.
//

import SwiftUI

struct StockListView: View {
    var body: some View {
                List{
                       Group{
                           Text("Amazon")
                           Text("Microsoft")
                           Text("Tesla")
                           Text("Facebook")
                       }
                       Group{
                           Text("Netflix")
                           Text("gjkgj")
                           Text("Teslgfva")
                           Text("Facebgjfhook")
                       }
                       Group{
                           Text("Netflix23")
                           Text("gjkgjhg78")
                           Text("Teslgfva452")
                           Text("Facebgjfhook238")
                       }

                   }
    }
}

struct StockListView_Previews: PreviewProvider {
    static var previews: some View {
        StockListView()
    }
}
