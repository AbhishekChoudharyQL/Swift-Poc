//
//  CurrentUserInfo.swift
//  FirebaseLoginSignUp
//
//  Created by abhishek on 10/05/23.
//

import Foundation
import FirebaseAuth

class CurrentUserInfo : ObservableObject {
    
    //MARK:  - Properties
    @Published var currentUserEmail : String?
    @Published var currentUserName : String?
    
    //MARK: - Public Methods
    func isUserLoggedIn() -> Bool {
            if (Auth.auth().currentUser != nil){
                DispatchQueue.main.async {
                self.currentUserName = Auth.auth().currentUser?.displayName
                self.currentUserEmail = Auth.auth().currentUser?.email
                }
                return true
            }
            else {
                return false
            }
    }
}

