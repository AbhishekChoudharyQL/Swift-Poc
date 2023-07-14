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
            leftView
            Spacer()
            if showHoldingColumn {
                centerView
            }
            rightView
        }
    }
}

//MARK: - Previews
struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        CoinRowView(coin: preview.coin, showHoldingColumn: true)
    }
}

//MARK: - Extension
extension CoinRowView {
    
    //MARK: - Properties
    private var leftView : some View {
        HStack(alignment: .center,spacing: 0,content: {   // if using hstack inside hstack
            //then spacing =0 helps may be to fix other elements layout
            Text("\(coin.rank)")
                .foregroundColor(Color.theme.secondaryTextColor)
                .padding(.leading , 2)
                .padding(.trailing, 6)
//                .frame(minWidth: 30)
            Circle()
                .frame(width: 30, height: 30)
            Text("\(coin.symbol.uppercased())")
                .font(.headline)
                .padding(.leading , 6)
                .foregroundColor(Color.theme.accentColor)
        })
    }
    
    private var centerView : some View {
        VStack(alignment: .trailing) {
            Text(coin.currentHoldingsValue.asCurrencyWith2Decimals())
                .bold()
            Text(coin.currentHoldings?.asNumberString() ?? "0")
        }.foregroundColor(Color.theme.accentColor)
//            .padding([.leading,.trailing])
    }
    
    private var rightView : some View {
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
        }).frame(width: UIScreen.main.bounds.width/3, alignment: .trailing)
            .padding(.trailing , 6)
    }
}
