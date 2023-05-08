//
//  SignUpButton.swift
//  FirebaseLoginSignUp
//
//  Created by abhishek on 05/05/23.
//

import SwiftUI

struct SignUpButton: View {
    var text : String
    var action: () -> Void
    var body: some View {
        Button (action: action) {
            Text(text)
                .frame(width: 300,height: 55)
                .background(.white)
                .foregroundColor(AppColor.bottomGradientColor)
                .cornerRadius(22)
        }
    }
}

