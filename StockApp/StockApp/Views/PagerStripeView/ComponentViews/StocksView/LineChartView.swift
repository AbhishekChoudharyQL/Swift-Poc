//
//  LineChartView.swift
//  StockApp
//
//  Created by abhishek on 30/04/23.
//

import SwiftUI
import Charts

struct LineChartView: View {
    //MARK: - Properties
    var priceValues: [Double] = [142.0, 148.6, 181.3, 125.2, 149.9]
    var name : String = "Spice Jet"
    var currentPrice : Double = 64.90
    var highestPrice : Double = 81.60
    // Normalize the price values to fit within the range of 0 to 1
    var normalizedValues: [Double] {
        let maxPrice = priceValues.max() ?? 1.0
        return priceValues.map { $0 / maxPrice }
    }

    //MARK: - View Builder
    var body: some View {
        ZStack {
            Line()
               .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
               .frame(height: 1)
            VStack{
                HStack(){
                    Spacer()
                    Button{
                        print("Bookmark")
                    } label: {
                        Image(systemName: "bookmark")
                            .foregroundColor(.green)
                            .frame(width: 30)
                            .padding(.trailing,10)
                    }
                }
                VStack(alignment: .leading,spacing: 0){
                    
                    Text(name)
                        .font(.title)
                        .bold()
                        .padding(.bottom,-10)
                        .padding(.leading)
                      Text("\(currentPrice)")
                        .font(.title2)
                        .padding()
                    
                    if LineColorFlag() == true {
                        LineShape(yValues: normalizedValues)
                            .stroke(Color.green, lineWidth: 2.5)
                    }
                    else if LineColorFlag() == false {
                        LineShape(yValues: normalizedValues)
                            .stroke(Color.red, lineWidth: 2.5)
                    }
                }
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
        }.frame(width: 385,height: 350)
    }
    private  func LineColorFlag() -> Bool {
        if priceValues[0] > priceValues[priceValues.count-1]{
            return false
        }
        else{
            return true
        }
    }
}
 
//MARK: - Previews
struct LineChartView_Previews: PreviewProvider {
    static var previews: some View {
        LineChartView()
    }
}

// MARK: - Line chart subview
struct LineShape : Shape {
    var yValues : [Double]
    let padding: CGFloat = 16.0
    
    func path(in rect : CGRect) -> Path {
        let xIncrement = (rect.width - 2*padding) / CGFloat(yValues.count - 1)
        var path = Path()
        path.move(to: CGPoint(x: padding, y: yValues[0]*Double(rect.height)))
        for i in 1..<yValues.count {
            let x = padding + CGFloat(i) * xIncrement
            let y = (1.0 - yValues[i]) * Double(rect.height)
            path.addLine(to: CGPoint(x: x, y: y))
        }
        return path
    }
}

//MARK: - dotted line subview
struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}

//MARK: - Custom Button styling
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
