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
    @ObservedObject var viewModel: SignUpViewModel
    @ObservedObject var loginViewModel: LoginViewModel
    @ObservedObject var currentUserInfo: CurrentUserInfo
    @ObservedObject var reciepeViewModel : ReciepeViewModel
    @State private var showListView = false
    
    //MARK: - View Builder
    var body: some View {
        ZStack {
            VStack {
                Text("Welcome \(currentUserInfo.currentUserName ?? "")!")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .padding(.bottom, 20)
                Text("Email: \(currentUserInfo.currentUserEmail ?? "")")
                    .foregroundColor(.white)
                    .font(.headline)
                    .padding(.bottom, 10)
                Image("logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 250, height: 250)
                    .padding([.top, .bottom], 40)
                CustomButton(text: "Add Your Recipe", action: {
                    showListView = true
                })
                CustomButton(text: "Log Out", action: loginViewModel.signOut)
            }
            .padding()
        }
   .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [AppColor.topGradientColor,
                                            AppColor.bottomGradientColor]),
                startPoint: .top, endPoint: .bottom
            )
        )
        .fullScreenCover(isPresented: $showListView, content: {
            ListView(reciepeViewModel: reciepeViewModel)
        })
    }
}
