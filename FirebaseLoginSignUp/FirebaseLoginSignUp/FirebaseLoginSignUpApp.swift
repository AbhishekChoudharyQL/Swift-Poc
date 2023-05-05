//
//  FirebaseLoginSignUpApp.swift
//  FirebaseLoginSignUp
//
//  Created by abhishek on 05/05/23.
//

import SwiftUI

@main
struct FirebaseLoginSignUpApp: App {
    var body: some Scene {
        WindowGroup {
            SignUpView(userNameText: "", emailText: "", passwordText: "")
           
        }
    }
}
