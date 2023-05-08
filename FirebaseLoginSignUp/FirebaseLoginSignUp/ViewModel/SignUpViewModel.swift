//
//  FirebaseAuth.swift
//  FirebaseLoginSignUp
//
//  Created by abhishek on 08/05/23.
//

import Foundation
import FirebaseAuth

class SignUpViewModel : ObservableObject {
    @Published var emailText : String = ""
    @Published var passwordText : String = ""
    @Published var userName : String = ""
    @Published var fireBaseSignUp : FireBaseAuth = FireBaseAuth()
    
    func registerUser() {
        fireBaseSignUp.register(email: emailText, password: passwordText)
    }

}
