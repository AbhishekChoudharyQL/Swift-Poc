//
//  LaunchScreenView.swift
//  StockApp
//
//  Created by abhishek on 02/05/23.
//

import SwiftUI

struct LaunchScreenView: View {
    
    //MARK: - Properties
    @EnvironmentObject private var launchScreenState : LaunchScreenStateManager
    @State private var firstAnimation = false
    @State private var secondAnimation = false
    @State private var startFadeoutAnimation = false
    @ViewBuilder
      private var image: some View {
          Image("GrowLogo")
              .resizable()
              .scaledToFit()
              .frame(width: 100, height: 100)
              .rotationEffect(firstAnimation ? Angle(degrees: 900) : Angle(degrees: 1800))
              .scaleEffect(secondAnimation ? 0 : 1)
              .offset(y: secondAnimation ? 400 : 0)
      }
    private let animationTimer = Timer.publish(every: 0.5, on: .current, in: .common)
        .autoconnect()
    
    //MARK: - View Builder
    var body: some View {
        ZStack(content: {
            image
           
        }).onReceive(animationTimer) {
            timer in
            updateAnimation()
        }.opacity(startFadeoutAnimation ? 0 : 1)
    }
    
    //MARK: - Private Methods
    private func updateAnimation() {
        switch launchScreenState.state {
        case .firstStep:
            withAnimation(.easeInOut(duration: 0.9)){
                firstAnimation.toggle()
            }
        case .secondStep:
            if secondAnimation == false {
                withAnimation(.linear){
                    self.secondAnimation = true
                    startFadeoutAnimation = true
                }
            }
        case .finished:
            break
        }
    }
}

 //MARK: - Previews
struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
            .environmentObject(LaunchScreenStateManager())
    }
}
