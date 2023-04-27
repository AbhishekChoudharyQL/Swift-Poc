//
//  PagerComponent.swift
//  StockApp
//
//  Created by abhishek on 27/04/23.
//

import SwiftUI

struct PagerComponent: View {
    var pagerTitle : String = ""
    var colorStatus : Bool = false
    var body: some View {
        Button(action: {

        }) {
            Text(pagerTitle)
                .frame(width: 110,height: 10)
                  .font(.system(size: 15))
                  .padding()
                  .foregroundColor(Color.black)
            }.overlay(
                RoundedRectangle(cornerRadius: 25)
                .stroke(Color.black.opacity(0.2), lineWidth: 2))
               .padding()

    }
}

struct PagerComponent_Previews: PreviewProvider {
    static var previews: some View {
        PagerComponent()
    }
}
