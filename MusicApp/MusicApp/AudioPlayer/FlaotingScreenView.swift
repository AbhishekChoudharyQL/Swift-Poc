//
//  FlaotingScreenView.swift
//  MusicApp
//
//  Created by abhishek on 05/04/23.
//

import SwiftUI

struct FlaotingScreenView: View {
    @State var opacity : Double = 1
    @State var height : CGFloat = 0
    @State var floating = false
    var body: some View {
        GeometryReader { geo in
            ZStack{
                Color.orange
            }.gesture(DragGesture()
                .onChanged({
                    (value) in
                    if self.height >= 0 {
                        self.height += value.translation.height
                    }
                })
                    .onEnded({ (value) in
                      if self.height > 10 {
                            self.height = geo.size.height - 60  // this will give the height of
                          self.opacity = 1                      // minimized screen
                          self.floating = true
                        }
                        else{
                            if self.height < geo.size.height - 100 {
                                self.height = 0
                            }
                            else {
                                self.height = geo.size.height - 75
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
        FlaotingScreenView()
    }
}
