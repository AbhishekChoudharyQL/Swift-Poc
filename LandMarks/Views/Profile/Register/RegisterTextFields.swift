//
//  RegisterTextFields.swift
//  LandMarks
//
//  Created by abhishek on 30/03/23.
//

import SwiftUI

struct RegisterTextFields: View {
   
//    @State private var fisrtNameRegister : String = ""
//    @State private var lastNameRegister : String = ""
//    @State private var emailRegister : String = ""
//    @State private var passwordRegister : String = ""
   @State private  var text : String = ""
    var title : String = ""
    var body: some View {
        TextField(title, text: $text)
                    .foregroundColor(.red)
                    .padding(.all)
                    .border(.cyan,width: 2)
                    .frame(width: UIScreen.main.bounds.width/1.4)
//        TextField("First-Name", text: $fisrtNameRegister)
//            .foregroundColor(.red)
//            .padding(.all)
//            .border(.cyan,width: 2)
//            .frame(width: UIScreen.main.bounds.width/1.4)
//        TextField("Last-Name", text: $lastNameRegister)
//            .padding(.all)
//            .border(.cyan,width: 2)
//            .frame(width: UIScreen.main.bounds.width/1.4)
//        TextField("Email", text: $emailRegister)
//            .padding(.all)
//            .border(.cyan,width: 2)
//            .frame(width: UIScreen.main.bounds.width/1.4)
//        TextField("Password", text: $passwordRegister)
//            .padding(.all)
//            .border(.cyan,width: 2)
//            .frame(width: UIScreen.main.bounds.width/1.4)
        
    }
}

struct RegisterTextFields_Previews: PreviewProvider {
    static var previews: some View {
        RegisterTextFields()
    }
}
