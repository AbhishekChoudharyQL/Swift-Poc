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
   
    //MARK: - View Builder
    var body: some Scene {
        WindowGroup {
//           SignUpView()
              StateManager(firebaseAuth: FireBaseAuth(), signUpViewModel: SignUpViewModel())
                .task({
               FirebaseApp.configure()
                })
           
        }
    }
}

