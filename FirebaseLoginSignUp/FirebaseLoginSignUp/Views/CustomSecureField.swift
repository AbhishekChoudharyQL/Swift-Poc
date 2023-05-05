//
//  CustomSecureField.swift
//  FirebaseLoginSignUp
//
//  Created by abhishek on 05/05/23.
//

import SwiftUI

struct CustomSecureField: View {
    var imageName : String = ""
    var placeholderText : String = ""
   @State var promptString : String
    var body: some View {
        HStack(content: {
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 45)
                .foregroundColor(.white)
                .padding(.trailing,65)
            SecureField("",text: $promptString,prompt: Text(placeholderText).foregroundColor(.white)).foregroundColor(.white)
        }).padding()
            .frame(width: 320)
        .background{
            RoundedRectangle(cornerRadius: 20)
                .strokeBorder(.white)
               
        }
    }
}

struct CustomSecureField_Previews: PreviewProvider {
    static var previews: some View {
        CustomSecureField(promptString: "")
    }
}
