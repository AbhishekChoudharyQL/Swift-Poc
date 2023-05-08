//
//  UserNameCustomTextfield.swift
//  FirebaseLoginSignUp
//
//  Created by abhishek on 08/05/23.
//

import SwiftUI

struct UserNameCustomTextfield: View {
    var imageName : String = ""
    var placeholderText : String = ""
   @State var inputString : String = "samplestring12345"
    var body: some View {
        HStack(content: {
            Image(systemName: SignUpData.personImage.rawValue)
                .resizable()
                .scaledToFit()
                .frame(height: 66)
                .foregroundColor(.white)
                .padding(.leading,-15)
                .padding(.trailing,40)
            TextField("",text: $inputString,prompt: Text(placeholderText).foregroundColor(.white)).foregroundColor(.white)
        }).padding()
            .frame(width: 320,height: 65)
        .background{
            RoundedRectangle(cornerRadius: 32)
                .strokeBorder(.white)
               
        }
    }
}

struct UserNameCustomTextfield_Previews: PreviewProvider {
    static var previews: some View {
        UserNameCustomTextfield()
    }
}
