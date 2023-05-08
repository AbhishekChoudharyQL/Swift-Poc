//
//  SignUpPageTitle.swift
//  FirebaseLoginSignUp
//
//  Created by abhishek on 05/05/23.
//

import SwiftUI

struct SignUpPageTitle: View {
    var body: some View {
        Text("FoodPie")
            .foregroundColor(.white)
            .padding()
            .font(
                .custom(
                "AmericanTypewriter",
                fixedSize: 34)
                .weight(.heavy)
              )
    }
}

struct SignUpPageTitle_Previews: PreviewProvider {
    static var previews: some View {
        SignUpPageTitle()
    }
}
