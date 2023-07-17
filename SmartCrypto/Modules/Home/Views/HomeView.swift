//
//  HomeView.swift
//  SmartCrypto
//
//  Created by abhishek on 13/07/23.
//

import SwiftUI

struct HomeView: View {
    
    //MARK: - Properties
    @State private var showPortfolio : Bool = false
    @EnvironmentObject private var viewModel : HomeViewModel
    
    //MARK: - View Builder
    var body: some View {
        ZStack {
            Color.theme.backgroundColor
                .ignoresSafeArea()
            VStack{
                homeHeader
                SearchBarView(searchText: $viewModel.searchText)
                columnTitles
                if !showPortfolio {
                    allCoinsList
                        .transition(.move(edge: .leading))
                }
                if showPortfolio {
                    portfolioCoinsList
                        .transition(.move(edge: .trailing))
                }
                Spacer(minLength: 0)
            }
        }
    }
}

//MARK: - Previews
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView(content: {
            HomeView()
                .navigationBarHidden(true)
        }).environmentObject(preview.homeViewModel)
    }
}

//MARK: - Extension
extension HomeView { 
    private var homeHeader : some View {
        HStack(content: {
            CircleButtonView(iconName: showPortfolio ? "plus" : "info")
                .animation(.none)
                .background(
                    CircleButtonAnimation(animate: $showPortfolio)
                )
            Spacer()
            Text(showPortfolio ? "Portfolio" : "Live Prices")
                .animation(.none)
                .foregroundColor(Color.theme.accentColor)
                .font(.headline)
                .fontWeight(.heavy)
                .animation(.none)
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()){
                        showPortfolio.toggle()
                    }
                }
        }).padding(.horizontal)
    }
    
    private var allCoinsList : some View {
        List {
            ForEach(viewModel.allCoins, content: {
                coins in
//                CoinImageView(coin: coins)
                CoinRowView(coin: coins, showHoldingColumn: false)
                    .listRowInsets(.init(top: 10, leading: 6, bottom: 10, trailing: 6))
            })
        }
        .listStyle(.plain)
    }
    
    private var portfolioCoinsList : some View {
        List {
            ForEach(viewModel.portfolioCoins, content: {
                coins in
                CoinRowView(coin: coins, showHoldingColumn: true)
                    .listRowInsets(.init(top: 10, leading: 6, bottom: 10, trailing: 6))
            })
        }
        .listStyle(.plain)
    }
    
    private var columnTitles : some View{
        HStack(content: {
            Text("Coin")
                .padding(.leading , 32)
            Spacer()
            if showPortfolio {
                Text("Holdings")
            }
            Text("Price")
                .frame(width: UIScreen.main.bounds.width/3 , alignment: .trailing)
                .padding(.trailing)
        }).font(.caption)
            .foregroundColor(Color.theme.secondaryTextColor)
    }
}
