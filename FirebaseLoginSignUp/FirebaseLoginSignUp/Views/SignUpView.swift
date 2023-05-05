//
//  ContentView.swift
//  FirebaseLoginSignUp
//
//  Created by abhishek on 05/05/23.
//

import SwiftUI

struct SignUpView: View {

    @State var userNameText : String
    @State var emailText : String
    @State var passwordText : String
    var body: some View {
        ZStack(content: {
            VStack(content: {
                HStack(alignment: .center,spacing: 0,content: {
                    CustomShapeAndLogo()
                        .padding()
                    SignUpPageTitle()
                })
                Text("Sign-Up")
                    .foregroundColor(.white)
                    .padding([.top,.bottom],20)
                    .font(
                        .custom(
                        "AmericanTypewriter",
                        fixedSize: 34)
                        .weight(.medium)
                        )
                    .underline()
                VStack(spacing: 20, content: {
                    CustomTextfield(imageName: SignUpData.personImage.rawValue, placeholderText: SignUpData.userNamePlaceholder.rawValue, promptString: userNameText)
                    CustomTextfield(imageName: SignUpData.emailImage.rawValue, placeholderText: SignUpData.emailPlaceholder.rawValue, promptString: emailText)
                    CustomSecureField(imageName: SignUpData.passwordImage.rawValue, placeholderText: SignUpData.passwordPlaceholder.rawValue, promptString: passwordText)
                })
                VStack(content: {
                    SignUpButton()
                    HStack(content: {
                        Text("Alredy have an account ?")
                            .foregroundColor(.white)
                        Button(action: {
                            print("Login-btn tapped")
                        }) {
                            Text("Login")
                                .foregroundColor(.white)
                                .font(.bold(.title3)())
                        }
                    })
                }).padding()
               
              
            }).padding(.bottom,20)
        }).frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .background(
            LinearGradient(gradient: Gradient(colors: [AppColor.topGradientColor, AppColor.bottomGradientColor]),startPoint: .top, endPoint: .bottom)
                )
   
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(userNameText: "", emailText: "", passwordText: "")
    }
}
