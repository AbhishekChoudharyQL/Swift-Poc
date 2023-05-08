//
//  LoginViewModel.swift
//  FirebaseLoginSignUp
//
//  Created by abhishek on 08/05/23.
//

import Foundation
import FirebaseAuth

class LoginViewModel : ObservableObject {
    @Published var emailText : String = ""
    @Published var passwordText : String = ""
    @Published var userName : String = ""
//    @Published var isSignUpSuccessful : Bool = false
    @Published var firebaseLogin : FireBaseAuth = FireBaseAuth()
    
    public func loginUser() {
        firebaseLogin.login(email: emailText, password: passwordText)
    }
}
