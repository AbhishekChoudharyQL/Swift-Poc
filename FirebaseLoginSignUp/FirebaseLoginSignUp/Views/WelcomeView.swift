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
    @ObservedObject var loginViewModel : LoginViewModel
    
    //MARK: - View Builder
    var body: some View {
        ZStack(content: {
            VStack {
                Text("Welcome, \(viewModel.userName)!")
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 20)
                
                Text("Email: \(viewModel.emailText)")
                    .foregroundColor(.white)
                    .font(.headline)
                    .padding(.bottom, 10)
                CustomButton(text: "SignOut", action: loginViewModel.signOut)
            }
            .padding()
        }).frame(width:UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .background(
            LinearGradient(gradient: Gradient(colors: [AppColor.topGradientColor, AppColor.bottomGradientColor]),startPoint: .top, endPoint: .bottom)
            )
     
    }
}
