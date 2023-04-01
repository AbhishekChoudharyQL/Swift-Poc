//
//  LoginView.swift
//  LandMarks
//
//  Created by abhishek on 30/03/23.
//

import SwiftUI

struct LoginView: View {
    @State var isNavigate = false
    var body: some View {
        NavigationView{
            VStack{
                Image("spalsh")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200,height: 150)
                    .padding()
                LoginTextFields()
                    .padding()
               
                    
//                    Button(action: LoginBtn() ){
//
//
//                    }
//
                NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true),isActive: $isNavigate,label: {
                    EmptyView()
                })
                Button(action: {
                    self.isNavigate = true
                },label: {
                    Text("Login")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 200, height: 50)
                        .background(Color.init(red: 242/255, green: 130/255, blue: 31/255))
                        .background(Color.orange)
                        .cornerRadius(15.0)
                }
                    )
                
               
                
              
                
            }
        }
//        VStack{
//            Image("spalsh")
//                .resizable()
//                .scaledToFill()
//                .frame(width: 200,height: 150)
//                .padding()
//            LoginTextFields()
//                .padding()
////            Button(action: {print("Login tapped")}){
////                LoginBtn()
////
////            }
//            Button(action: {print("Login Tapped")} ){
//                LoginBtn()
//
//            }
//
//        }
    }
}
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
