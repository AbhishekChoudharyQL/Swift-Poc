//
//  CardView.swift
//  StockApp
//
//  Created by abhishek on 27/04/23.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false){
            HStack(spacing: 25){
                CardComponentView(title: "NIFTY 50",currentStatus: "17847.40",changedStatus: "+34.35(0.20%)",isNegative: false)
                CardComponentView(title: "BANK NIFTY",currentStatus: "42852.70",changedStatus: "-12.45(0.03%)",isNegative: true)
                CardComponentView(title: "FINNIFTY" ,currentStatus: "19015.70",changedStatus: "+11.65(0.06%)",isNegative: false)
        CardComponentView(title: "SENSEX",currentStatus: "60419.77",changedStatus: "+131.58(0.22%)",isNegative: false)
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}

