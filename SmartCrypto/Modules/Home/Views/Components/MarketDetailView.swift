//
//  MarketDetailView.swift
//  SmartCrypto
//
//  Created by abhishek on 17/07/23.
//

import SwiftUI

struct MarketDetailView: View {
    
    let marketStatistics : StatisticalModel
    
    var body: some View {
        VStack(alignment: .leading,content: {
            Text(marketStatistics.title)
                .font(.caption)
                .foregroundColor(Color.theme.secondaryTextColor)
            Text(marketStatistics.value)
                .font(.headline)
                .foregroundColor(Color.theme.accentColor)
            HStack {
                Image(systemName: "triangle.fill")
                    .font(.caption2)
                    .rotationEffect(
                        Angle(degrees: marketStatistics.percentageChanged ?? 0 >= 0 ? 0 : 180))
                Text(marketStatistics.percentageChanged?.asPercentageString() ?? "")
                    .font(.caption)
                    .bold()
            }
            .foregroundColor(marketStatistics.percentageChanged ?? 0 >= 0 ? Color.theme.greenColor : Color.theme.redColor)
                .opacity(marketStatistics.percentageChanged == nil ? 0.0 : 1.0)
        } )
    }
}

struct MarketDetailView_Previews: PreviewProvider {
    static var previews: some View {
  
        MarketDetailView(marketStatistics: preview.stat1)
    }
}
