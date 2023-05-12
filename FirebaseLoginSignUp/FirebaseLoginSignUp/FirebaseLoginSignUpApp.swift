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
    
    //MARK: - Properties
    @StateObject var fireBaseAuth = FireBaseAuth()
    @StateObject var signupViewModel = SignUpViewModel()
    @StateObject var loginViewModel = LoginViewModel()
    @StateObject var currentUserInfo = CurrentUserInfo()
    
    //MARK: - Intializer
    init() {
        //MARK: - Configure Firebase
        FirebaseApp.configure()
        //MARK: - Setting Up Navigation Bar appearence
        UINavigationBar.appearance().backgroundColor =
        UIColor(AppColor.bottomGradientColor)
        
    }
    
    //MARK: - View Builder
    var body: some Scene {
        WindowGroup {
            StateManager()
                .environmentObject(fireBaseAuth)
                .environmentObject(signupViewModel)
                .environmentObject(loginViewModel)
                .environmentObject(currentUserInfo)
            
        }
    }
}

