//
//  SignUpPageTitle.swift
//  FirebaseLoginSignUp
//
//  Created by abhishek on 05/05/23.
//

import SwiftUI

struct PageTitleModifier: View {
    //MARK: - View Builder
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

//MARK: - Previews
struct SignUpPageTitle_Previews: PreviewProvider {
    static var previews: some View {
        PageTitleModifier()
    }
}
