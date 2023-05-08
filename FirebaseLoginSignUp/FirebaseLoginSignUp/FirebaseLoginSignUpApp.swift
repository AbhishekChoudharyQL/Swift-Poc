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
   
    var body: some Scene {
        WindowGroup {
           SignUpView()
//            LoginView()
                .task({
               FirebaseApp.configure()
                })
           
        }
    }
}

