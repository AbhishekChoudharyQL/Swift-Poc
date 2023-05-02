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
    var listChartModel : LineChartModel
    var normalizedValues: [Double] {
        let maxPrice = listChartModel.priceValues.max() ?? 1.0
        return listChartModel.priceValues.map { $0 / maxPrice }
    }

    //MARK: - View Builder
    var body: some View {
        ZStack {
            Line()
               .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
               .frame(height: 150)
            VStack(content: {
                    BookmarkButtonView(listChartModel: listChartModel)
                VStack(alignment: .leading, content: {
                    Text(listChartModel.name)
                        .font(.title)
                        .bold()
                        .padding(.bottom,-10)
                        .padding(.leading)
                    currentPriceFormatter(currentPrice: listChartModel.currentPrice)
                        .font(.title2)
                        .padding()
                })
                Spacer()
                        if LineColorFlag() == true {
                            LineShape(yValues: normalizedValues)
                                .stroke(Color.green, lineWidth: 2.5)
                        }
                        else if LineColorFlag() == false {
                            LineShape(yValues: normalizedValues)
                                .stroke(Color.red, lineWidth: 2.5)
                        }
                        SellBuyCustomButton()
                    .padding(.bottom,30)
            })
        }
    }
    
    //MARK: - Private Methods
    private  func LineColorFlag() -> Bool {
        if listChartModel.priceValues[0] > listChartModel.priceValues[listChartModel.priceValues.count-1]{
            return false
        }
        else{
            return true
        }
    }
    private func currentPriceFormatter(currentPrice: Double) -> Text {
        return Text("₹" + String(format: "%.2f", currentPrice))
    }

}
 
//MARK: - Previews
struct LineChartView_Previews: PreviewProvider {
    static var previews: some View {
        LineChartView(listChartModel: LineChartModel(priceValues: [142.0, 148.6, 181.3, 125.2, 149.9], isBookmarked: false, name: "Spice Jet", currentPrice: 64.90, highestPrice: 81.60))
    }
}

// MARK: - Line chart subview
struct LineShape : Shape {
    var yValues : [Double]
    let padding: CGFloat = 16.0
    
    func path(in rect : CGRect) -> Path {
        let xIncrement = (rect.width - 2*padding) / CGFloat(yValues.count - 1)
        var path = Path()
        path.move(to: CGPoint(x: padding + CGFloat(yValues[0]) * xIncrement, y: (1.0 - yValues[0]) * Double(rect.height)))
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

