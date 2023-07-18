//
//  PortfolioView.swift
//  SmartCrypto
//
//  Created by abhishek on 18/07/23.
//

import SwiftUI

struct PortfolioView: View {
    
    //MARK: - Properties
    @EnvironmentObject var viewModel : HomeViewModel
    @Environment(\.presentationMode) var presentationMode
    
    //MARK: - View Builder
    var body: some View {
        NavigationView(content: {
            ScrollView{
                VStack(alignment: .leading,spacing: 0, content: {
                    SearchBarView(searchText: $viewModel.searchText)
                    ScrollView(.horizontal,showsIndicators: false) {
                        LazyHStack(spacing: 20) {
                            ForEach(viewModel.allCoins){
                                coins in
                                CoinLogoView(coin: coins)
                                    .frame(width: 75)
                                /// if frame is not given then bigger image will take more space and smaller
                                ///  will take less and uneven space occurs
                            }
                            
                        }
                    }
                })
            }
            .navigationTitle("Edit Portfolio")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    XmarkButton(presentationMode: _presentationMode)
                }
            }
        })
    }
}

//MARK: - Previews
struct PortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioView()
            .environmentObject(preview.homeViewModel)
    }
}


