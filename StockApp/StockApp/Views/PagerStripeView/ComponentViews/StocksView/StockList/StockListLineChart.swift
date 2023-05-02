//
//  StockListLineChart.swift
//  StockApp
//
//  Created by abhishek on 01/05/23.
//

import SwiftUI

struct StockListLineChart: View {
    
    //MARK: - Properties
    var points : [Double] = [0]
    var normalizedValues: [Double] {
        let maxPrice = points.max() ?? 1.0
        return points.map { $0 / maxPrice }
    }
    
    //MARK: - View Builder
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
        }.frame(width: 50,height: 30)
    }
    
    //MARK: - Private Methods
    private  func lineColor() -> Bool {
        if points[0] >= points[points.count-1]{
            return false
        }
        else{
            return true
        }
    }
}

//MARK: - Previews
struct StockListLineChart_Previews: PreviewProvider {
    static var previews: some View {
        StockListLineChart()
    }
}

//MARK: - SubView to show Stock Line Chart 
struct LineView : Shape {
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
