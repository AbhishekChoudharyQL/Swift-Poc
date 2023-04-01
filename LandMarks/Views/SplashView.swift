//
//  SplashView.swift
//  LandMarks
//
//  Created by abhishek on 30/03/23.
//

import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    var body: some View {
        if isActive {
//            ContentView()
            RegisterView()
        } else {
            VStack{
                VStack{
                    Image("spalsh")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100,height: 100)
                        Text("Your Favorite Landmark")
                        .foregroundColor(.orange.opacity(0.8))
                        .font(Font.custom("Baskerville Bold", size: 25))
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 2.0)){
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                    
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now()+3.0){
                    self.isActive = true
                }
        }

        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
