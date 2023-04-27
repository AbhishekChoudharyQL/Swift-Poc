//
//  BookmarkList.swift
//  StockApp
//
//  Created by abhishek on 27/04/23.
//

import SwiftUI

struct BookmarkList: View {
    var body: some View {
        ZStack(content: {
            VStack(spacing: 100){
                NavigationStack {
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
        }).background(Color.blue)
        
    }
}

struct BookmarkList_Previews: PreviewProvider {
    static var previews: some View {
        BookmarkList()
    }
}

