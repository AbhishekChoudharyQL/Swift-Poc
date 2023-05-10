//
//  FirebaseAuth.swift
//  FirebaseLoginSignUp
//
//  Created by abhishek on 08/05/23.
//

import Foundation
import FirebaseAuth

class SignUpViewModel : ObservableObject {
    
    //MARK: - Properties
    @Published var emailText : String = ""
    @Published var passwordText : String = ""
    @Published var userName : String = ""
    @Published var fireBaseSignUp : FireBaseAuth = FireBaseAuth()
    @Published var SignUpStatus : Bool = false
    
    //MARK: - Methods
    func registerUser() {
    fireBaseSignUp.register(email: emailText, password: passwordText)
        { [weak self] success in
            if success {
                DispatchQueue.main.async {
                    self?.SignUpStatus = true
                }
            }
        }
    }
}
