//
//  WelcomeView.swift
//  FirebaseLoginSignUp
//
//  Created by abhishek on 08/05/23.
//

import SwiftUI
import FirebaseAuth

struct WelcomeView: View {
    
    //MARK: - Properties
    @ObservedObject var viewModel : SignUpViewModel
    @ObservedObject var loginViewModel : LoginViewModel
    @ObservedObject var currentUserInfo : CurrentUserInfo
    
    //MARK: - View Builder
    var body: some View {
        ZStack(content: {
            VStack {
                Text("Welcome," + (currentUserInfo.currentUserName ?? "")+"!")
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 20)
                
                Text("Email:" + (currentUserInfo.currentUserEmail ?? ""))
                    .foregroundColor(.white)
                    .font(.headline)
                    .padding(.bottom, 10)
                CustomButton(text: "SignOut", action: loginViewModel.signOut)
            }
            .padding()
}).frame(width:UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .background(
                LinearGradient(gradient:
        Gradient(colors: [AppColor.topGradientColor,
                          AppColor.bottomGradientColor]),
               startPoint: .top, endPoint: .bottom)
            )
        
    }
}
