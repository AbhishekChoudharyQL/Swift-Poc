//
//  OrderView.swift
//  StockApp
//
//  Created by abhishek on 28/04/23.
//

import SwiftUI

struct OrderView: View {
    var body: some View {
        VStack(spacing: 0){
            Image("No-order")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            Text("You don't have any order now")
                .foregroundColor(.green)
                .bold()
                .padding()
            Spacer()
        }
        
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
