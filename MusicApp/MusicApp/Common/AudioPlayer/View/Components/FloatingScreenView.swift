//
//  FlaotingScreenView.swift
//  MusicApp
//
//  Created by abhishek on 05/04/23.
//

import SwiftUI

struct FloatingScreenView: View {
    
    //MARK: - Properties
    @State var offset : CGFloat = 0 {
        didSet {
            print("new line")
            print(offset)
        }
    }
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
            .offset(y: self.offset)
            .scaleEffect(1.0)
        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    }

    //MARK: - private methods
    private func onGestureChange(_ value: DragGesture.Value)  {
//        print("ongesture changed, ", value.translation.height)
        if self.offset >= 0 {
            self.offset += value.translation.height
        }
    }

    private func onGestureEnded(_ value: DragGesture.Value, _ geo: GeometryProxy) {
        //print("ongesture ended, ", value.translation.height)
        if self.offset > 100 && !(self.floating) {
            self.offset = geo.size.height - 40 // this will give the height of miniplayer
            self.floating = true
        }  else if self.offset >= geo.size.height - 160 && self.floating {
            self.offset = 0
            self.floating = false
        }
        else{
            if self.offset < geo.size.height - 320  {
                self.offset = 0
                self.floating = false
            }
//            else {
//                self.offset = geo.size.height - 170
//                self.floating = false
//            }
        }
    }
}

//MARK: - Previews
struct FlaotingScreenView_Previews: PreviewProvider {
    static var previews: some View {
        FloatingScreenView()
    }
}
