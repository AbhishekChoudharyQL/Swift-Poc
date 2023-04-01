//
//  RefrenceCode.swift
//  LandMarks
//
//  Created by abhishek on 27/03/23.
//

import Foundation

//        VStack {
//            GeometryReader { geometry in
//                MapView()
//                    .ignoresSafeArea(edges: .top)
//                    .frame(width: geometry.size.width * 1, height: geometry.size.height * 0.8,alignment: .center)
//
//            }
//            GeometryReader {
//                geometry in
//                CircleImage()
//                    .frame(width: geometry.size.width*0.94,height: geometry.size.height*0.1, alignment: .center)
//            }
//            Text("TIGER HABITAT")
//                .foregroundColor(.green)
//                .font(.largeTitle)
//
//            HStack {
//                Text("Jim Corbett National Park")
//                    .font(.headline)
//                    .foregroundColor(.blue)
//                Spacer()
//                Text("Uttrakhand")
//                    .font(.headline)
//                    .foregroundColor(.blue)
//            }
//
//            Divider()
//            Text("About Jim Corbett")
//                .foregroundColor(.purple)
//                .font(.headline)
//
//            Text("Jim Corbett National Park is one of the best and the oldest habitats for tigers in the Himalayan region. It has the unique distinction of being the place where the famous project called the “Project tiger” or “operation Tiger” was launched in 1973.What makes Jim Corbett a fascinating place to visit is its rich variety of flora and fauna, soothing climate, fairytale-like landscapes and exotic wildlife. It is a perfect destination for wildlife holidays in India. It is the best tiger reserve to enjoy wildlife tourism. ")
//                .foregroundColor(.secondary)
//        }
//        .onAppear(perform: {
//            var x : [Landmark] = loadLandmarksArray("landmarkData.json")
//        })
//        .padding()
//        Spacer()




//struct CircleImage: View {
//    var image : Image
//    
//    var body: some View {
//        Image("turtlerock")
//        .clipShape(Circle())
//        //.border(.green)     gives square border along the text or images ......
//        .overlay(Circle().stroke(Color.white, lineWidth: 11))
//        // code to give stroke with color and border line width.......
//        .shadow(radius: 7)
//        // decent design for images......
//}
//}

//struct CircleImage_Previews: PreviewProvider {
//static var previews: some View {
//    CircleImage()
//
//}
//}

   // Category Item code for display image of landmark.
//               landmark.image
//                .renderingMode(.original)
//                .resizable()
//                .frame(width: 150,height: 140)
//                .cornerRadius(10)
//                .shadow(color: .green, radius: 2,x: 0,y: 5)

// Register View
//        ZStack{
//            Image("gaddafi-rusli-2ueUnL4CkV8-unsplash")
//                .resizable()
//                .edgesIgnoringSafeArea(.all)
//                .scaledToFill()
//                .opacity(0.5)
//            VStack(alignment:.center,spacing: 10) {
//                Image("spalsh")
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: 150, height: 150)
//                    .clipped()
//                    .cornerRadius(150)
//                    .padding(.bottom, 20)
//                Group{
//                    TextField("First-Name", text: $fisrtNameRegister)
//                    TextField("Last-Name", text: $lastNameRegister)
//                    TextField("Email", text: $emailRegister)
//                    SecureField("Password", text: $passwordRegister)
//
//                } .foregroundColor(.red)
//                    .padding(.all)
//                    .border(.cyan,width: 2)
//                    .frame(width: UIScreen.main.bounds.width/1.4)
//
//                VStack{
//             Button(action: {saveData()}){
//                                        Text("Register")
//                                            .font(.headline)
//                                            .foregroundColor(.white)
//                                            .padding()
//                                            .frame(width: 200, height: 50)
//                                            .background(Color.mint)
//                                            .cornerRadius(15.0)
//                                        }
//
//                }
//                Button(action: {print("Button tapped")}){
//                    AlreadyRegistered()
//
//                }
//                Spacer()
//                Text("Email:\(showEmail)")
//            }
//        }


//Button {
//                            saveData()
//                        } label: {
//                            Text("Register")
//                                .font(.headline)
//                                .foregroundColor(.white)
//                                .padding()
//                                .frame(width: 200, height: 50)
//                                .background(Color.orange)
//                                .cornerRadius(15.0)
//                        }

// Working Register View Code...

//
//import SwiftUI
//
//struct RegisterView: View {
//    //MARK: - Properties
//    @State private var fisrtNameRegister : String = ""
//    @State private var lastNameRegister : String = ""
//    @State private var emailRegister : String = ""
//    @State private var passwordRegister : String = ""
//    var userInfo :[UserData] = []
//    @State var isLinkActive = false
//
//    var showFirstName : String = ""
//    var showLastName : String  = ""
//    var showEmail : String  = ""
//    var showPassword : String = ""
////    init(){
////       let data = getData()
////        showFirstName = data.0
////        showLastName = data.1
////    }
//    //MARK: - View Builder
//    var body: some View {
//        ZStack {
//        NavigationView {
////                Image("steinar-engeland-UtEUUNHvMLs-unsplash")
////                    .resizable()
////                    .edgesIgnoringSafeArea(.all)
////                    .scaledToFill()
////                    .opacity(0.6)
//                VStack(alignment:.center,spacing: 10) {
//                    Image("spalsh")
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .frame(width: 120, height: 130)
//                        .clipped()
//                        .cornerRadius(150)
//                        .padding(.bottom, 20)
//                    Group{
//                        TextField("First-Name", text: $fisrtNameRegister)
//                        TextField("Last-Name", text: $lastNameRegister)
//                        TextField("Email", text: $emailRegister)
//                        SecureField("Password", text: $passwordRegister)
//
//                    } .foregroundColor(.black)
//                        .padding(.all)
//                        .border(.gray,width: 3)
//                        .frame(width: UIScreen.main.bounds.width/1.4)
//
//                        .padding()
//
//                    VStack{
//                    /// When we need to make change on next view.
////                        NavigationLink(destination: ContentView(), label: {
////                            Text("Register")
////                                .font(.headline)
////                                .foregroundColor(.white)
////                                .padding()
////                                .frame(width: 200, height: 50)
////                                .background(Color.orange)
////                                .cornerRadius(15.0)
////                        })
//
//                        NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true), isActive: $isLinkActive, label: {
//                            EmptyView()
//                        })
//                            Button(action: {
//                                saveData()
//                                self.isLinkActive = true
//                            }, label: {
//                                Text("Register")
//                                    .font(.headline)
//                                    .foregroundColor(.white)
//                                    .padding()
//                                    .frame(width: 200, height: 50)
//                                    .background(Color.orange)
//                                    .cornerRadius(15.0)
//                            })
//
//                    }
//                    NavigationLink(destination: LoginView().navigationBarBackButtonHidden(true), label:{
//                        Text("Already Registered? Login")
//                            .foregroundColor(.purple)
//                            .padding(.bottom)
//                    }).navigationBarBackButtonHidden(true)
//
////                        Button(action: {print("Button tapped")}){
////                            AlreadyRegistered()
////                        }
////
//                    Spacer()
//
//                }
//
//            }
//            .navigationTitle("Register")
//            .navigationBarTitleDisplayMode(.large)
//        }
//
//    }
//    //MARK: - Private Methods
//    private func saveData(){
//        UserDefaults.standard.set(fisrtNameRegister, forKey: "fisrtNameRegister")
//        UserDefaults.standard.set(lastNameRegister, forKey: "lastNameRegister")
//        UserDefaults.standard.set(emailRegister, forKey: "emailRegister")
//        UserDefaults.standard.set(passwordRegister, forKey: "passwordRegister")
//        let data = getData()
////        let FirstName = data.0
////        let LastName = data.1
//        print(data.0)
//        print(data.1)
//
//    }
//    private  func getData() -> (String, String){
////        showFirstName = UserDefaults.standard.string(forKey: "fisrtNameRegister") ?? "Empty-FirstName"
////        showLastName = UserDefaults.standard.string(forKey: "lastNameRegister") ?? "Empty-LastName"
////        showEmail = UserDefaults.standard.string(forKey: "emailRegister") ?? "Empty-Email"
////        showPassword = UserDefaults.standard.string(forKey: "passwordRegister") ?? "Empty-Password"
////        print(showEmail)
////        print(showFirstName)
////        print(showLastName)
//                let firstName = UserDefaults.standard.string(forKey: "fisrtNameRegister") ?? ""
//                let lastName = UserDefaults.standard.string(forKey: "lastNameRegister") ?? ""
////               print(firstName)
//                return (firstName, lastName)
//    }
//}
////MARK: - Previews
//struct RegisterView_Previews: PreviewProvider {
//    static var previews: some View {
//        RegisterView()
//    }
//}

