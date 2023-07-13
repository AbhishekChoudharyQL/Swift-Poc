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
    let showHoldingColumn : Bool
    
    //MARK: - View Builder
    var body: some View {
        HStack(alignment: .top, spacing: 0){
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
            if showHoldingColumn {
                VStack(alignment: .trailing) {
                    Text(coin.currentHoldingsValue.asCurrencyWith6Decimals())
                        .bold()
                    Text(coin.currentHoldings?.asNumberString() ?? "0")
                }.foregroundColor(Color.theme.accentColor)
                    .padding([.leading,.trailing])
            }
            VStack(alignment: .trailing, content: {
                Text(coin.currentPrice.asCurrencyWith6Decimals())
                    .bold()
                    .foregroundColor(Color.theme.accentColor)
                coin.priceChangePercentage24H.map { changePercentage in
                    Text((changePercentage).asPercentageString())
                        .foregroundColor(
                            changePercentage >= 0 ? Color.theme.greenColor
                            : Color.theme.redColor
                        )
                   }
            }).frame(width: UIScreen.main.bounds.width/3)
            .padding(.trailing , 6)
        }
    }
}

//MARK: - Previews
struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        CoinRowView(coin: preview.coin, showHoldingColumn: true)
    }
}
