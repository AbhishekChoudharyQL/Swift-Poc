//
//  TabBar.swift
//  MusicApp
//
//  Created by abhishek on 03/04/23.
//

import SwiftUI
enum Tab : String , CaseIterable {
    case music = "music.note.list"
    case heart = "heart.circle.fill"
    case magnifyingglass = "magnifyingglass.circle.fill"
}

struct TabBar: View {
//    @Binding var selectedTab : Tab
    
    @State var selectedTab : Tab = .music
    
    var body: some View {
        
        HStack(content: {
            ForEach(Tab.allCases, id: \.rawValue) { element in
                CustomTabItem(tab: element, itemAction: {
                    self.selectedTab = element
                }).opacity(selectedTab == element ? 1 : 0.5)
            }
        })
        .padding(20)
        .background(Color.black)
     
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
            .previewDevice("iPhone 14 Pro Max")
            .previewLayout(.sizeThatFits)
            
    }
}

//struct CustomTabItem: View {
//    let tab: Tab
//    let itemAction : (() -> ())
//
//    var body: some View {
//        Button(action: {
//            itemAction()
//        }, label: {
//            Image(systemName: tab.rawValue)
//                .resizable()
//                .frame(width: 60, height: 60, alignment: .center)
//                .padding(.horizontal)
//        })
//        .tint(.white)
//    }
//}
