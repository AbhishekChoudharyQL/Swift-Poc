//
//  MarketDetailView.swift
//  SmartCrypto
//
//  Created by abhishek on 17/07/23.
//

import SwiftUI

struct MarketDetailView: View {
    
//    let marketStatistics : MarketStatisticalModel
    
    var body: some View {
        VStack(alignment: .leading,content: {
            Text("Market")
                .font(.caption)
                .foregroundColor(Color.theme.secondaryTextColor)
            Text("Value")
                .font(.headline)
                .foregroundColor(Color.theme.accentColor)
            HStack {
                Image(systemName: "triangle.fill")
                    .font(.caption2)
//                    .rotationEffect(
//                        Angle(degrees: marketStatistics.percentageChange ?? 0 >= 0 ? 0 : 180))
//                Text(marketStatistics.percentageChange?.asPercentageString() ?? "")
//                    .font(.caption)
//                    .bold()
            }
//            .foregroundColor(marketStatistics.percentageChange ?? 0 >= 0 ? Color.theme.greenColor : Color.theme.redColor)
//                .opacity(marketStatistics.percentageChange == nil ? 0.0 : 1.0)
        } )
    }
}

struct MarketDetailView_Previews: PreviewProvider {
    static var previews: some View {
  
        MarketDetailView()
    }
}
