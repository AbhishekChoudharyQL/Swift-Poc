//
//  CardComponentView.swift
//  StockApp
//
//  Created by abhishek on 27/04/23.
//

import SwiftUI

struct CardComponentView: View {
    var title : String = ""
    var currentStatus : String = ""
    var changedStatus : String = ""
    var isNegative : Bool = false
    var body: some View {
        VStack(alignment: .leading,spacing: 20){
           Text(title)
                .font(.title3)
            .bold()
            HStack(spacing: 12){
                Text(currentStatus)
                Text(changedStatus)
                    .foregroundColor(isNegative ? .red : .green)
                    .bold()
            }
        }.layoutPriority(20)
            .padding()
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 120/255, green: 130/255, blue: 130/255, opacity: 0.4), lineWidth: 1.5)
                )
    }
}

struct CardComponentView_Previews: PreviewProvider {
    static var previews: some View {
        CardComponentView()
    }
}

