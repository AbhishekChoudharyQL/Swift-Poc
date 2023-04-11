//
//  TabBar.swift
//  MusicApp
//
//  Created by abhishek on 03/04/23.
//

import SwiftUI


struct TabBar: View {
    @Binding var selectedTab : TabItems
    
    var body: some View {
        ZStack( content: {
            VStack(content: {
//                MiniPlayerView()
                HStack(content: {
                    ForEach(TabItems.allCases, id: \.rawValue) { element in
                        CustomTabItem(tab: element, itemAction: {
                            selectedTab = element
                        }).opacity(selectedTab == element ? 1 : 0.5)
                        
                    }
                })
                .padding(20)
                .frame(width: UIScreen.main.bounds.width, height: 70)
                .background(Color.black
                    .cornerRadius(50)
                    .padding(.leading)
                    .padding(.trailing)
                )
            })
        })
        
        
       
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(selectedTab: .constant(.home))
            .previewDevice("iPhone 14 Pro Max")
            .previewLayout(.sizeThatFits)
    }
}


