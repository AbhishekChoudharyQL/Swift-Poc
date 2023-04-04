//
//  CustumTabView.swift
//  MusicApp
//
//  Created by abhishek on 03/04/23.
//

import SwiftUI

struct CustomTabItem: View {
    let tab: Tab
    let itemAction : (() -> ())

    var body: some View {
        Button(action: {
            itemAction()
        }, label: {
            Image(systemName: tab.rawValue)
                .resizable()
                .frame(width: 60, height: 60, alignment: .center)
                .padding(.horizontal)
        })
        .tint(.white)
    }
}

