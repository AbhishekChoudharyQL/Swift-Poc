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
   @Binding var inputString : String
    var body: some View {
        HStack(content: {
            PasswordTextfieldImage()
                .padding(.leading,-15)
                .padding(.trailing,40)
            SecureField("",text: $inputString,prompt: Text(placeholderText).foregroundColor(.white)).foregroundColor(.white)
        }).padding()
            .frame(width: 320,height: 65)
        .background{
            RoundedRectangle(cornerRadius: 32)
                .strokeBorder(.white)
        }
    }
}

struct CustomSecureField_Previews: PreviewProvider {
    static var previews: some View {
        CustomSecureField(inputString: .constant(""))
    }
}
