//
//  LoginViewModel.swift
//  FirebaseLoginSignUp
//
//  Created by abhishek on 08/05/23.
//

import Foundation
import FirebaseAuth

class LoginViewModel : ObservableObject {
    //MARK: - Properties
    @Published var emailText : String = ""
    @Published var passwordText : String = ""
    @Published var userName : String = ""
    @Published var firebaseLogin : FireBaseAuth = FireBaseAuth()
    
    //MARK: - Methods
    public func loginUser() {
        firebaseLogin.login(email: emailText, password: passwordText)
    }
}
