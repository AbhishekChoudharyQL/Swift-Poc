//
//  CustomTabItem.swift
//  MusicApp
//
//  Created by abhishek on 04/04/23.
//

import SwiftUI

struct CustomTabItem: View {
    let tab: TabItems
    let itemAction : (() -> ())

    var body: some View {
        Button(action: {
            itemAction()
        }, label: {
            Image(systemName: tab.rawValue)
                .resizable()
                .font(.system(size: 25,weight: .regular,design: .default))
                .frame(width: 50, height: 50, alignment: .center)
                .padding(.horizontal)
                .foregroundColor(.white)
        })
        .tint(.white)
        .padding()
    }
}

struct CustomTabItem_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabItem(tab: TabItems.home, itemAction: {
            // 
        }).background(Color(.black))
    }
}
