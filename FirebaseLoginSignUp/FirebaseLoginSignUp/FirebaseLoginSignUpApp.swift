//
//  FirebaseLoginSignUpApp.swift
//  FirebaseLoginSignUp
//
//  Created by abhishek on 05/05/23.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

@main
struct FirebaseLoginSignUpApp: App {
   @StateObject var fireBaseAuth = FireBaseAuth()
   @StateObject var signupViewModel = SignUpViewModel()
   @StateObject var loginViewModel = LoginViewModel()
    //MARK: - View Builder
    var body: some Scene {
        WindowGroup {
//           SignUpView()
            StateManager()
                .environmentObject(fireBaseAuth)
                .environmentObject(signupViewModel)
                .environmentObject(loginViewModel)
                .task({
               FirebaseApp.configure()
                })
           
        }
    }
}

