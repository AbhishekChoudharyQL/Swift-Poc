//
//  SignUpButton.swift
//  FirebaseLoginSignUp
//
//  Created by abhishek on 05/05/23.
//

import SwiftUI

struct CustomButton: View {
    //MARK: - Properties
    var text : String
    var action: () -> Void
    
    //MARK: - View Builder
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

