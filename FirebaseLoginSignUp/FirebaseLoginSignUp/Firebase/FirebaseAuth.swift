//
//  FirebaseAuth.swift
//  FirebaseLoginSignUp
//
//  Created by abhishek on 08/05/23.
//

import Foundation
import FirebaseAuth

class FireBaseAuth : ObservableObject {
    
    //MARK: - Methods
    func register(email: String, password: String, completion: @escaping (Bool) -> Void) {
            Auth.auth().createUser(withEmail: email, password: password) { _, error in
                if let error = error {
                    print("Error registering user: \(error.localizedDescription)")
                    completion(false)
                } else {
                    print("User registered successfully!")
                    completion(true)
                }
            }
        }
    
    func login(email : String, password : String) {
        Auth.auth().signIn(withEmail: email, password: password){
            result , error in
            if error != nil {
                print(error?.localizedDescription ?? "Login error")
            }
            else {
                print("Login successfully")
            }
        }
    }
}
