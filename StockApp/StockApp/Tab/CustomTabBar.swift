//
//  CustomTabBar.swift
//  StockApp
//
//  Created by abhishek on 27/04/23.
//

import SwiftUI

struct CustomTabBar: View {
    
    //MARK: - Properties
    @Binding var  selectedTab : TabItems
    
    //MARK: - View Builder
    var body: some View {
            HStack{
                ForEach(TabItems.allCases,id: \.rawValue){
                    tab in
                    Spacer()
                    VStack {
                        Image(systemName: tab.rawValue)
                            .scaleEffect(tab == selectedTab ? 1.30 : 1.0)
                            .foregroundColor(tab == selectedTab ? .green : .gray)
                            .font(.system(size: 30))
                            .onTapGesture {
                            selectedTab = tab
                        }
                    }
                    Spacer()
                }
            }.frame(width: nil,height: 60)
            .background(.ultraThinMaterial)
    }
}

  //MARK: - Previews
struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(selectedTab: .constant(.stocks))
    }
}
