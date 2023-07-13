//
//  CoinRowView.swift
//  SmartCrypto
//
//  Created by abhishek on 13/07/23.
//

import SwiftUI

struct CoinRowView: View {
    
    //MARK: - Properties
    let coin : CoinModel
    
    //MARK: - View Builder
    var body: some View {
        HStack(spacing: 0){
            Text("\(coin.rank)")
                .foregroundColor(Color.theme.secondaryTextColor)
                .frame(minWidth: 30)
            Circle()
                .frame(width: 30, height: 30)
            Text("\(coin.symbol.uppercased())")
                .font(.headline)
                .padding(.leading , 8)
                .foregroundColor(Color.theme.accentColor)
            Spacer()
            VStack(alignment: .trailing, content: {
                Text("\(coin.currentPrice)")
                    .bold()
                    .foregroundColor(Color.theme.accentColor)
                coin.priceChangePercentage24H.map { changePercentage in
                    Text("\(changePercentage)")
                        .foregroundColor(
                            changePercentage >= 0 ? Color.theme.greenColor
                            : Color.theme.redColor
                        )
                   }
            })
        }
    }
}

//MARK: - Previews
struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        CoinRowView(coin: preview.coin)
    }
}
