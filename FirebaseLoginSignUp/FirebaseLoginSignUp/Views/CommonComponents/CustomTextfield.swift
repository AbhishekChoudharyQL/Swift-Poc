//
//  CustomTextfield.swift
//  FirebaseLoginSignUp
//
//  Created by abhishek on 05/05/23.
// UIScreen.main.bounds.height/11

import SwiftUI

struct CustomTextfield: View {
//    @ObservedObject var firebaseAuth : FirebaseAuth
    var imageName : String = ""
    var placeholderText : String = ""
   @Binding var inputString : String
    var body: some View {
        HStack(content: {
            Image(systemName: SignUpData.emailImage.rawValue)
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

struct CustomTextfield_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextfield(inputString: .constant(""))
    }
}
