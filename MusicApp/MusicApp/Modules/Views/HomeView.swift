//
//  HomeView.swift
//  MusicApp
//
//  Created by abhishek on 03/04/23.
//

import SwiftUI

struct HomeView: View {
    @State var isAnimating = false
    var body: some View {
        ZStack {
        Image("musichome")
                .resizable()
                .scaledToFill()
                .scaleEffect(isAnimating ? 1.0 : 0.6)
              
            VStack{
                Text("Your Music APP")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .bold()
            }
        }
        .cornerRadius(30)
        .onAppear {
            withAnimation(.easeIn(duration: 1.0)){
                isAnimating = true
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
