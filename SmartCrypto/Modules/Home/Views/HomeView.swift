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
    
    //MARK: - View Builder
    var body: some View {
        ZStack {
            Color.theme.backgroundColor
                .ignoresSafeArea()
            VStack{
                homeHeader
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
        })
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
}
