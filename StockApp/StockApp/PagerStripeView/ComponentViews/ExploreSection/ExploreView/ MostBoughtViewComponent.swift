//
//  MostBoughtView.swift
//  StockApp
//
//  Created by abhishek on 28/04/23.
//  .layoutPriority(100)

import SwiftUI

struct  MostBoughtViewComponent: View {
    var image : String = "RailVikasNigam"
    var title : String = "IRFC"
    var currentValue : Double = 31.90
    var changedStatus : String = "0.45(1.43%)"
    var isNegative : Bool = false
    var body: some View {
       
        VStack(alignment: .leading,content: {
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 80,height: 65)
                .padding(.top,15)
            Text(title)
                .font(.title3)
                .bold()
                .padding(.bottom,10)
            currentPriceFormatter()
                .padding(.bottom,3)
            if isNegative {
               Text("-" + changedStatus)
                    .foregroundColor(.red)
                    .bold()
                    .padding(.bottom,15)
            }
            else {
              Text("+" + changedStatus)
                    .foregroundColor(.green)
                    .bold()
                    .padding(.bottom,15)
            }
                
        }).frame(width: UIScreen.main.bounds.width/2.85,height: UIScreen.main.bounds.height/4.2)
            .padding()
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 120/255, green: 130/255, blue: 130/255, opacity: 0.4), lineWidth: 1.5)
                )
    }
    private func currentPriceFormatter() -> Text {
        return Text("₹" + String(format: "%.2f", currentValue))
    }

}

struct MostBoughtViewComponent_Previews: PreviewProvider {
    static var previews: some View {
         MostBoughtViewComponent()
    }
}
