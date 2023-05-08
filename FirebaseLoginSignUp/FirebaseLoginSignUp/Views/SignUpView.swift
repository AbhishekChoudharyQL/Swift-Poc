//
//  ContentView.swift
//  FirebaseLoginSignUp
//
//  Created by abhishek on 05/05/23.
//

import SwiftUI
import FirebaseAuth

struct SignUpView: View {
    
    //MARK: - Properties
    @ObservedObject var signUpViewModel : SignUpViewModel = SignUpViewModel()
    @State var navigationFlag = false
    
    //MARK: - View Builder
  var body: some View {
      NavigationView(content: {
          ZStack(content: {
            VStack(content: {
                HStack(alignment: .center,spacing: 0,content: {
                    CustomShapeAndLogo()
                        .padding()
                    PageTitleModifier()
                        .underline()
                })
                Text("SIGN-UP")
                    .foregroundColor(.white)
                    .padding([.top,.bottom],20)
                    .font(
                        .custom(
                        "AmericanTypewriter",
                        fixedSize: 34)
                        .weight(.medium)
                        )
                VStack(spacing: 15, content: {
                    CustomTextfield(imageName: SignUpData.personImage.rawValue, placeholderText: SignUpData.userNamePlaceholder.rawValue, inputString: $signUpViewModel.userName)
                    CustomTextfield(imageName: SignUpData.emailImage.rawValue, placeholderText: SignUpData.emailPlaceholder.rawValue, inputString: $signUpViewModel.emailText)
                    CustomSecureField(imageName: SignUpData.passwordImage.rawValue, placeholderText: SignUpData.passwordPlaceholder.rawValue, inputString: $signUpViewModel.passwordText)
                })
                VStack(content: {
                    CustomButton(text: "SIGN UP", action: signUpViewModel.registerUser)
                    HStack(content: {
                        Text("Alredy have an account ?")
                            .foregroundColor(.white)
                            .padding(.trailing,5)
                        NavigationLink(destination: LoginView().navigationBarBackButtonHidden(true), isActive: self.$navigationFlag, label: {
                            EmptyView()
                        })
                        Button(action: {
                            print("Login-btn tapped")
                            self.navigationFlag = true
                        }) {
                            Text("Login")
                                .foregroundColor(.white)
                                .font(.bold(.title3)())
                            }
                        })
                    }).padding()
                }).padding(.bottom,20)
              NavigationLink(destination: WelcomeView(userName: signUpViewModel.userName, email: signUpViewModel.emailText).navigationBarBackButtonHidden(true), isActive: $signUpViewModel.signInStatus) {
                                EmptyView()
                            }
            }).frame(width:UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .background(
                LinearGradient(gradient: Gradient(colors: [AppColor.topGradientColor, AppColor.bottomGradientColor]),startPoint: .top, endPoint: .bottom)
                )
         })
    }
}

//MARK: - Previews
struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}


