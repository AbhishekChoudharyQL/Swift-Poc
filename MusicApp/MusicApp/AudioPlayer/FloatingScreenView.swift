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
            ZStack{
               AudioPlayerView()
            }//: Setting dynamic frame for Zstack
            .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height)
                .edgesIgnoringSafeArea(.all)
            .gesture(DragGesture()
                .onChanged({
                    (value) in
                    if self.height >= 0 {
                        self.height += value.translation.height
                    }
                })
                    .onEnded({ (value) in
                      if self.height > 100 && !self.floating {
                         self.height = geo.size.height  - 150 // this will give the height of
                          self.opacity = 1                      // minimized screen
                          self.floating = true
                        }
                        else{
                            if self.height < geo.size.height - 300  {
                                self.height = 0
                            }
                            else {
                                self.height = geo.size.height - 150
                                self.floating = false
                            }
                        }
                    })
            ).opacity(opacity)
                .offset(y:self.height)
                .animation(.spring())
            
             }
          }
      }

struct FlaotingScreenView_Previews: PreviewProvider {
    static var previews: some View {
        FloatingScreenView()
    }
}

