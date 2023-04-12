//
//  FlaotingScreenView.swift
//  MusicApp
//
//  Created by abhishek on 05/04/23.
//

import SwiftUI

struct FloatingScreenView: View {
    
    //MARK: - Properties
    @State var offset : CGFloat = 0
    @State var audioPlayerVisiblityState : AudioPlayerVisiblityState = .minimised
    
    //MARK: - View Builder
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .top, content: {
                AudioPlayerView()
                
                if audioPlayerVisiblityState == .minimised {
                    MiniPlayerView()
                }
            })
            .onAppear(perform: {
                if audioPlayerVisiblityState == .minimised {
                    offset = geo.size.height - 40
                }
                
                if audioPlayerVisiblityState == .maximised {
                    offset = 0
                }
            })
            .gesture(DragGesture()
                .onChanged({
                    (value) in
                    onGestureChange(value)
                })

                .onEnded({ (value) in
                    onGestureEnded(value, geo)
                })
            )
            .offset(y: self.offset)
            .scaleEffect(1.0)
        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    }

    //MARK: - private methods
    private func onGestureChange(_ value: DragGesture.Value)  {
        if self.offset >= 0 {
            self.offset += value.translation.height
        }
    }

    private func onGestureEnded(_ value: DragGesture.Value, _ geo: GeometryProxy) {
        let middlePoint = geo.size.height / 2
        if self.offset > middlePoint {
            self.offset = geo.size.height - 40
            audioPlayerVisiblityState = .minimised
            
        }
        
        if self.offset < middlePoint  {
            self.offset = 0
            audioPlayerVisiblityState = .maximised
        }
    }

}

//MARK: - Previews
struct FlaotingScreenView_Previews: PreviewProvider {
    static var previews: some View {
        FloatingScreenView()
    }
}
