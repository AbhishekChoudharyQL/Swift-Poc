//
//  FlaotingScreenView.swift
//  MusicApp
//
//  Created by abhishek on 05/04/23.
//

import SwiftUI

struct FloatingScreenView: View {
    //MARK: - Properties
    @State var opacity : Double = 1
    @State var height : CGFloat = 0
    @State var floating = false
    
    //MARK: - View Builder
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .top, content: {
                MiniPlayerView()
                AudioPlayerView()
                    .opacity(0.3)
            })//: Setting dynamic frame for Zstack
            .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height)
            .edgesIgnoringSafeArea(.top)
            .gesture(DragGesture()
                .onChanged({
                    (value) in
                    onGestureChange(value)
                })
                     
                .onEnded({ (value) in
                    onGestureEnded(value, geo)
                })
            ).opacity(opacity)
                .offset(y:self.height)
                .scaleEffect(1.0)
            //                .animation(.easeInOut)
            
        }
    }
    
    //MARK: - private methods
    private func onGestureChange(_ value: DragGesture.Value)  {
        if self.height >= 0 {
            self.height += value.translation.height
        }
    }
    
    private func onGestureEnded(_ value: DragGesture.Value, _ geo: GeometryProxy) {
        if self.height > 100 && !self.floating {
            self.height = geo.size.height - 150 // this will give the height of
            self.opacity = 1                      // minimized screen
            self.floating = true
        } else{
            if self.height < geo.size.height - 300  {
                self.height = 0
            }
            else {
                self.height = geo.size.height - 150
                self.opacity = 0.1
                self.floating = false
            }
        }
    }
}

struct FlaotingScreenView_Previews: PreviewProvider {
    static var previews: some View {
        FloatingScreenView()
    }
}

