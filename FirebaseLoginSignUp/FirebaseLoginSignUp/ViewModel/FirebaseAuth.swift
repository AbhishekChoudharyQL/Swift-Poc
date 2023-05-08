//
//  FirebaseAuth.swift
//  FirebaseLoginSignUp
//
//  Created by abhishek on 08/05/23.
//

import Foundation
import FirebaseAuth

class FirebaseAuth : ObservableObject {
    @Published var emailText : String?
    @Published var passwordText : String?
    @Published var isSignUpSuccessful : Bool = false
    
    func register(){
        guard let emailText = emailText,let passwordText = passwordText else {return}
//        guard let passwordText = passwordText else {return}
        Auth.auth().createUser(withEmail: emailText, password: passwordText){
            result , error in
            if let error = error {
                         print("Error registering user: \(error.localizedDescription)")
                     } else {
                         print("User registered successfully!")
                         self.isSignUpSuccessful = true
                     }
        }
    }
}
