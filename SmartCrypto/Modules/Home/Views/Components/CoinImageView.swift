//
//  CoinImageView.swift
//  SmartCrypto
//
//  Created by abhishek on 14/07/23.
//

import SwiftUI

struct CoinImageView: View {
    
    //MARK: - Properties
    @StateObject var viewModel : CoinImageDownloadViewModel
  
    init(coin : CoinModel){
        _viewModel = StateObject(wrappedValue: CoinImageDownloadViewModel(coin: coin))
    }
    
    //MARK: - View Builder
    var body: some View {
        ZStack(content: {
            if let image = viewModel.coinImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            }
            else if viewModel.isLoading {
                ProgressView()
            }
            else {
                Image(systemName: "questionmark")
                    .foregroundColor(Color.theme.secondaryTextColor)
            }
        })
    }
}

 //MARK: - Previews
struct CoinImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoinImageView(coin: preview.coin)
            .previewLayout(.sizeThatFits)
    }
}
