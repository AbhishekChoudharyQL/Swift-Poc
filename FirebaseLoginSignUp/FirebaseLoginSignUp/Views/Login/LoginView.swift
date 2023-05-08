//
//  LoginView.swift
//  FirebaseLoginSignUp
//
//  Created by abhishek on 05/05/23.
//

import SwiftUI

struct LoginView: View {
   @State var loginUserName : String
   @State var loginPassword : String
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
                        CustomTextfield(imageName: LoginData.personImage.rawValue, placeholderText: LoginData.userNamePlaceholder.rawValue, inputString: loginUserName )
                        CustomSecureField(imageName: LoginData.passwordImage.rawValue, placeholderText: LoginData.passwordPlaceholder.rawValue, inputString: loginPassword)
                        LoginButton(text: "LOGIN")
                    })
                    HStack(content: {
                        Text("Don't have an account?")
                            .foregroundColor(.white)
                        Button(action: {
                            print("Login-btn tapped")
                        }) {
                            Text("Sign Up Now")
                                .foregroundColor(.white)
                                .font(.bold(.title3)())
                        }
                    })
                })
            }).frame(width:UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .background(
                LinearGradient(gradient: Gradient(colors: [AppColor.topGradientColor, AppColor.bottomGradientColor]),startPoint: .top, endPoint: .bottom)
                    )
        })
       

    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(loginUserName: "", loginPassword: "")
    }
}
