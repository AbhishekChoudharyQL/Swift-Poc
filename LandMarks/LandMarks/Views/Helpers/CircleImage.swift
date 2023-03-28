//
//  CircleImage.swift
//  LandMarks
//
//  Created by abhishek on 24/03/23.
//

import SwiftUI

struct CircleImage: View {
    //MARK: - Properties 
    var image : Image
    var body: some View {
        image
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.white,lineWidth: 12)
            )
            .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock") )
            
    }
}
