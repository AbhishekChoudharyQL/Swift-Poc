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
    //MARK: - View Builder
    var body: some View {
        image
            .renderingMode(.original)
            .resizable()
            .scaledToFit()
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.white,lineWidth: 10)
            )
            .shadow(radius: 7)
            .frame(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.width / 2, alignment: .center)
    }
}
//MARK: - Previews
struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock") )
            
    }
}
