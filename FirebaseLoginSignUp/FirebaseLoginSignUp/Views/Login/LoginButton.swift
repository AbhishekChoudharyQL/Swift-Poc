//
//  LoginButton.swift
//  FirebaseLoginSignUp
//
//  Created by abhishek on 05/05/23.
//

import SwiftUI

struct LoginButton: View {
    var text : String
    var body: some View {
        Button (action: {
            print("Login button tapped")
        }) {
            Text(text)
                .frame(width: 300,height: 55)
                .background(.white)
                .foregroundColor(AppColor.bottomGradientColor)
                .cornerRadius(22)
        }
    }
}

struct LoginButton_Previews: PreviewProvider {
    static var previews: some View {
        LoginButton(text: "")
    }
}
