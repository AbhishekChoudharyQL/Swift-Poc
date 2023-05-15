//
//  SideMenuBarView.swift
//  FirebaseLoginSignUp
//
//  Created by abhishek on 14/05/23.
//

import SwiftUI

struct SideMenuBarView: View {
    
    //MARK: - Properties
    @ObservedObject var currentUserInfo: CurrentUserInfo
    @ObservedObject var loginViewModel : LoginViewModel
    @Binding var isPresenting : Bool
    
    //MARK: - View Builder
    var body: some View {
        ZStack(alignment: .leading){
            HStack{
                VStack(alignment: .leading){
                    Button{
                        isPresenting.toggle()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 20,height: 40)
                            .foregroundColor(AppColor.topGradientColor)
                            .padding()
                        Text("Close")
                            .foregroundColor(AppColor.topGradientColor)
                            .font(.callout)
                            .fontWeight(.regular)
                    }
                    Spacer().frame(height: 100)
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .scaledToFill()
                        .foregroundColor(AppColor.topGradientColor)
                        .frame(width: 60,height: 80)
                    Text("Email: \(currentUserInfo.currentUserEmail ?? "")")
                        .foregroundColor(AppColor.topGradientColor)
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding(.bottom,50)
                    //MARK: SignOut Button
                    Button{
                        loginViewModel.signOut()
                    } label: {
                        VStack{
                            Image(systemName: "rectangle.portrait.and.arrow.forward")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                                .foregroundColor(AppColor.topGradientColor)
                            Text("SignOut")
                                .foregroundColor(AppColor.topGradientColor)
                                .font(.callout)
                                .fontWeight(.regular)
                        }.padding(.bottom)
                    }
                    //MARK: Settings Button
                    Button {
                        
                    } label: {
                        VStack{
                            Image(systemName: "gearshape.fill")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                                .foregroundColor(AppColor.topGradientColor)
                            Text("Settings")
                                .foregroundColor(AppColor.topGradientColor)
                                .font(.callout)
                                .fontWeight(.regular)
                        }.padding(.top)
                    }
                }.padding()
                Spacer()
            }
            .frame(height: UIScreen.main.bounds.height)
            .padding()
            .background{
                Color.white
            }
        }
        .frame(width: 250)
    }
}

//MARK: - Previews
struct SideMenuBarView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuBarView(currentUserInfo: CurrentUserInfo(), loginViewModel: LoginViewModel(),
                        isPresenting: .constant(false))
    }
}



