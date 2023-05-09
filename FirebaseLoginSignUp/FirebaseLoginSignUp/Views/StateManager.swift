//
//  StateManager.swift
//  FirebaseLoginSignUp
//
//  Created by abhishek on 09/05/23.
//

import SwiftUI

struct StateManager: View {
    
    //MARK: - Properties
    @ObservedObject var firebaseAuth : FireBaseAuth
    @ObservedObject var signUpViewModel : SignUpViewModel
    
    //MARK: - View Builder
    var body: some View {
        switch firebaseAuth.state {
        case .signedOut : SignUpView()
          let _ =  print("\(firebaseAuth.state)")
        case .signedIn : WelcomeView(viewModel: signUpViewModel)
        }
    }
}

//MARK: - Previews
struct StateManager_Previews: PreviewProvider {
    static var previews: some View {
        StateManager(firebaseAuth: FireBaseAuth(), signUpViewModel: SignUpViewModel())
    }
}
