//
//  LoginTextFields.swift
//  LandMarks
//
//  Created by abhishek on 30/03/23.
//

import SwiftUI

struct LoginTextFields: View {
    @State private var emailForLogin : String = ""
    @State private var passwordForLoin : String = ""
    var body: some View {
        VStack{
            TextField("Email", text: $emailForLogin)
                .foregroundColor(.red)
                .padding(.all)
                .border(.cyan,width: 2)
                .frame(width: UIScreen.main.bounds.width/1.4)
                .padding()
            SecureField("Password", text: $passwordForLoin)
                    .foregroundColor(.red)
                    .padding(.all)
                    .border(.cyan,width: 2)
                    .frame(width: UIScreen.main.bounds.width/1.4)
        }
    }
}

struct LoginTextFields_Previews: PreviewProvider {
    static var previews: some View {
        LoginTextFields()
    }
}
