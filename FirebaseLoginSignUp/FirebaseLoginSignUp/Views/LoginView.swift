//
//  LoginView.swift
//  FirebaseLoginSignUp
//
//  Created by abhishek on 05/05/23.
//

import SwiftUI

struct LoginView: View {
    
    //MARK: - Properties
    @ObservedObject var loginViewModel : LoginViewModel = LoginViewModel()
    @State var navigationFlag = false
    @ObservedObject var signUpViewModel : SignUpViewModel
    
    //MARK: - View Builder
    var body: some View {
        NavigationView(content: {
            ZStack(content: {
                VStack(spacing: 40,content: {
                    CustomShapeAndLogo()
                    Text("FoodPie")
                        .foregroundColor(.white)
                        .font(
                            .custom(
                            "AmericanTypewriter",
                            fixedSize: 34)
                            .weight(.heavy)
                          )
                    VStack(spacing: 30,content: {
                        CustomTextfield(imageName: LoginData.emailImage.rawValue, placeholderText: LoginData.emailNamePlaceholder.rawValue, inputString: $loginViewModel.emailText )
                        CustomSecureField(imageName: LoginData.passwordImage.rawValue, placeholderText: LoginData.passwordPlaceholder.rawValue, inputString: $loginViewModel.passwordText)
                        CustomButton(text: "LOGIN", action: loginViewModel.loginUser)
                    })
                    HStack(content: {
                        Text("Don't have an account?")
                            .foregroundColor(.white)
                            .padding(.trailing,5)
                        NavigationLink(destination: SignUpView().navigationBarBackButtonHidden(true), isActive: self.$navigationFlag, label: {
                            EmptyView()
                        })
                        Button(action: {
                            print("Login-btn tapped")
                            self.navigationFlag = true
                        }) {
                            Text("Sign Up Now")
                                .foregroundColor(.white)
                                .font(.bold(.title3)())
                        }
                    })
                })
//                NavigationLink(destination: WelcomeView(userName: signUpViewModel.userName, email: loginViewModel.emailText).navigationBarBackButtonHidden(true), isActive: $loginViewModel.logInStatus) {
//                    EmptyView()
//                }
            }).frame(width:UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .background(
                LinearGradient(gradient: Gradient(colors: [AppColor.topGradientColor, AppColor.bottomGradientColor]),startPoint: .top, endPoint: .bottom)
                )
        })
    }
}

//MARK: - Previews
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(signUpViewModel: SignUpViewModel())
    }
}
