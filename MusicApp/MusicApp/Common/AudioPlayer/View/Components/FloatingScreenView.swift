//
//  FlaotingScreenView.swift
//  MusicApp
//
//  Created by abhishek on 05/04/23.
//

import SwiftUI

struct FloatingScreenView: View {
    
    //MARK: - Properties
    @State var height : CGFloat = 0
    @State var floating = false
    
    //MARK: - View Builder
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .top, content: {
                AudioPlayerView()

                if self.floating {
                    MiniPlayerView()
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
            .offset(y:self.height)
            .scaleEffect(1.0)
        }.frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height)
    }

    //MARK: - private methods
    private func onGestureChange(_ value: DragGesture.Value)  {
        if self.height >= 0 {
            self.height += value.translation.height
        }
    }

    private func onGestureEnded(_ value: DragGesture.Value, _ geo: GeometryProxy) {
        if self.height > 100 && !self.floating {
            self.height = geo.size.height - 40 // this will give the height of
            self.floating = true
        }  else if self.height >= geo.size.height - 160 && self.floating {
            self.height = 0

            self.floating = false
        }
        else{
            if self.height < geo.size.height - 320  {
                self.height = 0
                self.floating = false
            }
            else {
                self.height = geo.size.height - 170
                self.floating = false
            }
        }
    }
}//:- FloatingScreenView Ends Here

//MARK: - Previews
struct FlaotingScreenView_Previews: PreviewProvider {
    static var previews: some View {
        FloatingScreenView()
    }
}


//160
