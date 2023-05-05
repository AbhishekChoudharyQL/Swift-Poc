//
//  CustomShapeAndLogo.swift
//  FirebaseLoginSignUp
//
//  Created by abhishek on 05/05/23.
//

import SwiftUI

struct CustomShapeAndLogo: View {
    var body: some View {
        ZStack(content: {
            Image("FoodLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 125, height: 125)
                .background{
                    Color.white
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .frame(width: 85,height: 85)
                        .rotationEffect(Angle(degrees: 60))
                }
        
        }).background{
            Color.white.opacity(0.14)
                .clipShape(RoundedRectangle(cornerRadius: 15))
        }
        

    }
}

struct CustomShapeAndLogo_Previews: PreviewProvider {
    static var previews: some View {
        CustomShapeAndLogo()
    }
}
