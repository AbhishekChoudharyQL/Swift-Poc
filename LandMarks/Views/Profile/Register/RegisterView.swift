//
//  RegisterView.swift
//  LandMarks
//
//  Created by abhishek on 30/03/23.
//

import SwiftUI

struct RegisterView: View {
    //MARK: - Properties
    @State private var fisrtNameRegister : String = ""
    @State private var lastNameRegister : String = ""
    @State private var emailRegister : String = ""
    @State private var passwordRegister : String = ""
    var userInfo :[UserData] = []
    @State var isLinkActive = false
    //MARK: - View Builder
    var body: some View {
        ZStack {
        NavigationView {
                VStack(alignment:.center,spacing: 10) {
                    Image("spalsh")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 120, height: 130)
                        .clipped()
                        .cornerRadius(150)
                        .padding(.bottom, 20)
                    Group{
                        TextField("First-Name", text: $fisrtNameRegister)
                        TextField("Last-Name", text: $lastNameRegister)
                        TextField("Email", text: $emailRegister)
                        SecureField("Password", text: $passwordRegister)
                        
                    } .foregroundColor(.black)
                        .padding(.all)
                        .border(.gray,width: 3)
                        .frame(width: UIScreen.main.bounds.width/1.4)
                        
                        .padding()
                      
                    VStack{
                        NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true), isActive: $isLinkActive, label: {
                            EmptyView()
                        })
                            Button(action: {
                                saveData()
                                self.isLinkActive = true
                            }, label: {
                                Text("Register")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(width: 200, height: 50)
                                    .background(Color.orange)
                                    .cornerRadius(15.0)
                            })
                        
                    }
                    NavigationLink(destination: LoginView().navigationBarBackButtonHidden(true), label:{
                        Text("Already Registered? Login")
                            .foregroundColor(.purple)
                            .padding(.bottom)
                    }).navigationBarBackButtonHidden(true)

                    Spacer()
                       
                }
                
            }
            .navigationTitle("Register")
            .navigationBarTitleDisplayMode(.large)
        }
        
    }
    //MARK: - Private Methods
    private func saveData(){
        UserDefaults.standard.set(fisrtNameRegister, forKey: "fisrtNameRegister")
        UserDefaults.standard.set(lastNameRegister, forKey: "lastNameRegister")
        UserDefaults.standard.set(emailRegister, forKey: "emailRegister")
        UserDefaults.standard.set(passwordRegister, forKey: "passwordRegister")
        let data = getData()
        print(data.0)
        print(data.1)
    
    }
    private  func getData() -> (String, String){
                let firstName = UserDefaults.standard.string(forKey: "fisrtNameRegister") ?? ""
                let lastName = UserDefaults.standard.string(forKey: "lastNameRegister") ?? ""
                return (firstName, lastName)
    }
}
//MARK: - Previews
struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
