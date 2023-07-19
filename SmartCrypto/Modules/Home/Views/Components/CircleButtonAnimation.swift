//
//  CircleButtonAnimation.swift
//  SmartCrypto
//
//  Created by abhishek on 13/07/23.
//

import SwiftUI

struct CircleButtonAnimation: View {
    
    //MARK: - Properties
    @Binding var animate : Bool
    
    //MARK: - View Builder
    var body: some View {
        Circle()
            .stroke(lineWidth: 5)
            .scale(animate ? 1.0 : 0.0)
            .opacity(animate ? 0.0 : 1.0)
        // Todo :  i tried to change this to animation(_ , value :)
        //         but not getting the same results as given by this animation
            .animation(animate ? Animation.easeOut(duration: 1.0) : .none)
            
    }
}

struct CircleButtonAnimation_Previews: PreviewProvider {
    static var previews: some View {
        CircleButtonAnimation(animate: .constant(false))
            .foregroundColor(.red)
            .frame(width: 100, height: 100)
         
    }
}
