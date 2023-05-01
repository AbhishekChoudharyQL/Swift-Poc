//
//  LineChartViewForList.swift
//  StockApp
//
//  Created by abhishek on 01/05/23.
//

import SwiftUI

struct LineChartViewForList: View {
    var lineModel : LineChartModel
    var normalizedValues: [Double] {
        let maxPrice = lineModel.priceValues.max() ?? 1.0
        return lineModel.priceValues.map { $0 / maxPrice }
    }
    var body: some View {
        VStack{
            if lineColor() == true {
                LineView(yValues: normalizedValues)
                    .stroke(Color.green, lineWidth: 2.5)
            }
            else if lineColor() == false {
                LineView(yValues: normalizedValues)
                    .stroke(Color.red, lineWidth: 2.5)
            }
        }
    }
    private  func lineColor() -> Bool {
        if lineModel.priceValues[0] > lineModel.priceValues[lineModel.priceValues.count-1]{
            return false
        }
        else{
            return true
        }
    }
}

struct LineChartViewForList_Previews: PreviewProvider {
    static var previews: some View {
        LineChartViewForList(lineModel: LineChartModel(priceValues: [142.0, 148.6, 181.3, 125.2, 149.9], name: "Spice Jet", currentPrice: 64.90, highestPrice: 81.60))
    }
}
// MARK: - Line chart subview
struct LineView : Shape {
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
