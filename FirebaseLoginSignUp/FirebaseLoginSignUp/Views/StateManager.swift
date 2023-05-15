//
//  StateManager.swift
//  FirebaseLoginSignUp
//
//  Created by abhishek on 09/05/23.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct StateManager: View {
    
    //MARK: - Properties
    @EnvironmentObject var firebaseAuth: FireBaseAuth
    @EnvironmentObject var signUpViewModel: SignUpViewModel
    @EnvironmentObject var loginViewModel : LoginViewModel
    @EnvironmentObject var currentUserInfo : CurrentUserInfo
    @StateObject var reciepeViewModel = ReciepeViewModel()
    
    //MARK: - View Builder
    var body: some View {
        if currentUserInfo.isUserLoggedIn() {
        WelcomeView(viewModel: signUpViewModel, loginViewModel: loginViewModel,       currentUserInfo: currentUserInfo,
                reciepeViewModel: reciepeViewModel)
        }
        else {
            LoginView(loginViewModel: loginViewModel,
                      signUpViewModel: signUpViewModel)
        }
    }
}

//MARK: - Previews
struct StateManager_Previews: PreviewProvider {
    static var previews: some View {
        StateManager()
            .environmentObject(FireBaseAuth())
            .environmentObject(SignUpViewModel())
            .environmentObject(LoginViewModel())
            .environmentObject(CurrentUserInfo())
    }
}
