//
//  CoinLogoView.swift
//  SmartCrypto
//
//  Created by abhishek on 18/07/23.
//

import SwiftUI

struct CoinLogoView: View {
    
    //MARK: - Properties
    let coin : CoinModel
    
    var body: some View {
        VStack(spacing: 2, content: {
            CoinImageView(coin: coin)
                .frame(width: 50, height: 50)
            Text(coin.symbol.uppercased())
                .font(.headline)
                .foregroundColor(Color.theme.accentColor)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
            Text(coin.name)
                .font(.caption)
                .foregroundColor(Color.theme.secondaryTextColor)
                .lineLimit(2)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
        })
      
    }
}

struct CoinLogoView_Previews: PreviewProvider {
    static var previews: some View {
        CoinLogoView(coin: preview.coin)
    }
}
