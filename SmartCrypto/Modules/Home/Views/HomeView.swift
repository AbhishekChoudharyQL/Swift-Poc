//
//  HomeView.swift
//  SmartCrypto
//
//  Created by abhishek on 13/07/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color.theme.backgroundColor
                .ignoresSafeArea()
            
            VStack{
                Text("Header")
                Spacer(minLength: 0)
            }
        }

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView(content: {
            HomeView()
                .navigationBarHidden(true)
        })
        HomeView()
    }
}

