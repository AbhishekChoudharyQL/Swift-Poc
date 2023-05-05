//
//  SignUpButton.swift
//  FirebaseLoginSignUp
//
//  Created by abhishek on 05/05/23.
//

import SwiftUI

struct SignUpButton: View {
    var body: some View {
        Button (action: {
            print("Sign up button tapped")
        }) {
            Text("Sign Up")
                .frame(width: 300,height: 55)
                .background(.white)
                .foregroundColor(AppColor.bottomGradientColor)
                .cornerRadius(22)
        }
    }
}

struct SignUpButton_Previews: PreviewProvider {
    static var previews: some View {
        SignUpButton()
    }
}
