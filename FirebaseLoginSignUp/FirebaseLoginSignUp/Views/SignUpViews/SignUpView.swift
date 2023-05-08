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
    @State var userNameText : String
    @State var emailText : String
    @State var passwordText : String
    @State private var isSignUpSuccessful = false
    
    //MARK: - View Builder
    var body: some View {
    ZStack(content: {
        VStack(content: {
            HStack(alignment: .center,spacing: 0,content: {
                CustomShapeAndLogo()
                    .padding()
                SignUpPageTitle()
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
                CustomTextfield(imageName: SignUpData.personImage.rawValue, placeholderText: SignUpData.userNamePlaceholder.rawValue, inputString: userNameText)
                CustomTextfield(imageName: SignUpData.emailImage.rawValue, placeholderText: SignUpData.emailPlaceholder.rawValue, inputString: emailText)
                CustomSecureField(imageName: SignUpData.passwordImage.rawValue, placeholderText: SignUpData.passwordPlaceholder.rawValue, promptString: passwordText)
            })
            VStack(content: {
                SignUpButton(text: "SIGN UP", action: register)
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
                .sheet(isPresented: $isSignUpSuccessful) {
                                WelcomeView(userName: userNameText, email: emailText)
                            }
            }).padding(.bottom,20)
        }).frame(width:UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .background(
            LinearGradient(gradient: Gradient(colors: [AppColor.topGradientColor, AppColor.bottomGradientColor]),startPoint: .top, endPoint: .bottom)
            )
    }
    
    //MARK: - Methods
    func register(){
        Auth.auth().createUser(withEmail: emailText, password: passwordText){
            result , error in
            if let error = error {
                         print("Error registering user: \(error.localizedDescription)")
                     } else {
                         print("User registered successfully!")
                         isSignUpSuccessful = true
                     }
        }
    }
    func login() {
        Auth.auth().signIn(withEmail: emailText, password: passwordText){
            result , error in
            if error != nil {
                print(error?.localizedDescription ?? "Login error")
            }
        }
    }
}

//MARK: - Previews
struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(userNameText: "", emailText: "", passwordText: "")
    }
}


