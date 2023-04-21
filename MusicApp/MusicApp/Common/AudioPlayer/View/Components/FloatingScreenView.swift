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
    
    @StateObject var audioPlayerViewModel : AudioPlayerViewModel
    
    //MARK: - View Builder
    var body: some View {
        GeometryReader { geometryReaderProxy in
            ZStack(alignment: .top, content: {
                AudioPlayerView(audioPlayerViewModel: audioPlayerViewModel)
                
                if audioPlayerVisiblityState == .minimised {
                    MiniPlayerView(audioPlayerViewModel: audioPlayerViewModel)
                }
            })
            .frame(width: geometryReaderProxy.size.width, height: geometryReaderProxy.size.height)
            .onAppear(perform: {
                if audioPlayerVisiblityState == .minimised {
                    offset = getMiniplayerOffset(from: geometryReaderProxy)
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
                    onGestureEnded(value, geometryReaderProxy)
                })
            )
            .offset(y: self.offset)
            .scaleEffect(1.0)
        }.frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height)
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
            self.offset = getMiniplayerOffset(from: geo)
            audioPlayerVisiblityState = .minimised
            
        }
        
        if self.offset < middlePoint  {
            self.offset = 0
            audioPlayerVisiblityState = .maximised
        }
    }
    
    private func getMiniplayerOffset(from geometryProxy: GeometryProxy) -> Double {
//        (geometryProxy.size.height)
        return  (geometryProxy.size.height-20)
    }

}

//MARK: - Previews
struct FlaotingScreenView_Previews: PreviewProvider {
    static var previews: some View {
        FloatingScreenView(audioPlayerViewModel: AudioPlayerViewModel())
    }
}
