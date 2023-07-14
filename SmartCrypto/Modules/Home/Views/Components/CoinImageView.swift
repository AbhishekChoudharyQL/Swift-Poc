//
//  CoinImageView.swift
//  SmartCrypto
//
//  Created by abhishek on 14/07/23.
//

import SwiftUI

struct CoinImageView: View {
    
    //MARK: - Properties
    @StateObject var viewModel = CoinImageDownloadViewModel()
    
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
        CoinImageView()
    }
}
