//
//  SellBuyCustomButton.swift
//  StockApp
//
//  Created by abhishek on 01/05/23.
//

import SwiftUI

struct SellBuyCustomButton: View {
  
   //MARK: - View Builder
    var body: some View {
        HStack(spacing: 20,content: {
            Button("Sell"){
                print("sell btn is tapped")
            }
            .background(Color.red)
            .buttonStyle(GrowingButton())
            Button("Buy"){
                print("Buy btn is tapped")
            }
            .buttonStyle(GrowingButton())
            .background(Color.green)
        })
    }
}

  //MARK: - Previews
struct SellBuyCustomButton_Previews: PreviewProvider {
    static var previews: some View {
        SellBuyCustomButton()
    }
}

 //MARK: - Custom Button
struct GrowingButton : ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .foregroundColor(.white)
            .clipShape(Rectangle())
            .scaleEffect(configuration.isPressed ? 1.5 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
            .frame(width: 120)
    }
}
