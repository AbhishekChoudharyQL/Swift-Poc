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
        HStack(content: {
            ForEach(TabItems.allCases, id: \.rawValue) { element in
                CustomTabItem(tab: element, itemAction: {
                    selectedTab = element
                }).opacity(selectedTab == element ? 1 : 0.5)
                
            }
        })
        .padding(20)
        .frame(width: UIScreen.main.bounds.width)
        .background(Color.black)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(selectedTab: .constant(.music))
            .previewDevice("iPhone 14 Pro Max")
            .previewLayout(.sizeThatFits)
    }
}


