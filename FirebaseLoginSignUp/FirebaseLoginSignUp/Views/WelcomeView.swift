//
//  WelcomeView.swift
//  FirebaseLoginSignUp
//
//  Created by abhishek on 08/05/23.
//

import SwiftUI

struct WelcomeView: View {
    
    //MARK: - Properties
    @ObservedObject var viewModel : SignUpViewModel
    
    //MARK: - View Builder
    var body: some View {
        VStack {
            Text("Welcome, \(viewModel.userName)!")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 20)
            
            Text("Email: \(viewModel.emailText)")
                .font(.headline)
                .padding(.bottom, 10)
            Spacer()
        }
        .padding()
    }
}
