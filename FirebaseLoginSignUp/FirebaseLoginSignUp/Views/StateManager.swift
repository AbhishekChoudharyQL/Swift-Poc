//
//  StateManager.swift
//  FirebaseLoginSignUp
//
//  Created by abhishek on 09/05/23.
//

import SwiftUI

struct StateManager: View {
    // @ObservedObject var firebaseAuth : FireBaseAuth
   // @ObservedObject var signUpViewModel : SignUpViewModel
    //MARK: - Properties
    @EnvironmentObject var firebaseAuth: FireBaseAuth
    @EnvironmentObject var signUpViewModel: SignUpViewModel
    @EnvironmentObject var loginViewModel : LoginViewModel

    //MARK: - View Builder
    var body: some View {
        let _ = print("\(firebaseAuth.state)")
        //        switch firebaseAuth.state {
        //        case .signedOut:
        //            SignUpView(signUpViewModel: signUpViewModel, loginviewModel: loginViewModel)
        //        case .signedIn:
        //            WelcomeView(viewModel: signUpViewModel)
        //        }
        if loginViewModel.logInStatus == true {
            WelcomeView(viewModel: signUpViewModel, loginViewModel: loginViewModel)
        }
        else if signUpViewModel.SignUpStatus == true {
            WelcomeView(viewModel: signUpViewModel, loginViewModel: loginViewModel)
        }
        else if loginViewModel.logInStatus == false {
            LoginView(loginViewModel: loginViewModel, signUpViewModel: signUpViewModel)
        }
        else {
            LoginView(loginViewModel: loginViewModel, signUpViewModel: signUpViewModel)
        }
    }
}


//MARK: - Previews
struct StateManager_Previews: PreviewProvider {
    static var previews: some View {
        StateManager()
            .environmentObject(FireBaseAuth())
    }
}
