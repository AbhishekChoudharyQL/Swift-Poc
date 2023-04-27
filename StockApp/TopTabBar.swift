//
//  TopTabBar.swift
//  StockApp
//
//  Created by abhishek on 27/04/23.
//

import SwiftUI

//struct TopTabBar: View {
//    @State private var selection = 0
//
//       var body: some View {
//           VStack(spacing: 0) {
//               // Custom tab bar
//               HStack(spacing: 0) {
//                   TabBarItem(title: "Explore", systemImageName: "magnifyingglass", isSelected: selection == 0) {
//                       self.selection = 0
//                   }
//
//                   TabBarItem(title: "Holdings", systemImageName: "dollarsign.square.fill", isSelected: selection == 1) {
//                       self.selection = 1
//                   }
//
//                   TabBarItem(title: "Orders", systemImageName: "list.bullet", isSelected: selection == 2) {
//                       self.selection = 2
//                   }
//               }
//               .frame(height: 50)
//               .background(Color.white.shadow(color: .gray, radius: 1, x: 0, y: 2))
//
//               // Tab view with page style
//               TabView(selection: $selection) {
//                   ExploreView()
//                       .tag(0)
//
//                   HoldingsView()
//                       .tag(1)
//
//                   OrdersView()
//                       .tag(2)
//               }
//               .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
//           }
//           .edgesIgnoringSafeArea(.bottom)
//       }
//}
//struct TabBarItem: View {
//    let title: String
//    let systemImageName: String
//    let isSelected: Bool
//    let action: () -> Void
//
//    var body: some View {
//        Button(action: action) {
//            VStack(spacing: 4) {
//                Image(systemName: systemImageName)
//                    .font(.system(size: 22))
//                    .foregroundColor(isSelected ? .blue : .gray)
//
//                Text(title)
//                    .font(.caption)
//                    .foregroundColor(isSelected ? .blue : .gray)
//            }
//            .frame(maxWidth: .infinity)
//            .padding(.vertical, 8)
//            .background(isSelected ? Color.blue.opacity(0.1) : Color.clear)
//        }
//    }
//}
//
//struct ExploreView: View {
//    var body: some View {
//        Text("Explore View")
//    }
//}
//
//struct HoldingsView: View {
//    var body: some View {
//        Text("Holdings View")
//    }
//}
//
//struct OrdersView: View {
//    var body: some View {
//        Text("Orders View")
//    }
//}
//struct TopTabBar_Previews: PreviewProvider {
//    static var previews: some View {
//        TopTabBar()
//    }
//}
