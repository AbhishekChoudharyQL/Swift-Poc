//
//  CustomTextfield.swift
//  FirebaseLoginSignUp
//
//  Created by abhishek on 05/05/23.
// UIScreen.main.bounds.height/11

import SwiftUI

struct CustomTextfield: View {
    //MARK: - properties
    var imageName : String = ""
    var placeholderText : String = ""
    @Binding var inputString : String
    
    //MARK: - View Builder
    var body: some View {
        HStack(content: {
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 66)
                .foregroundColor(.white)
                .padding(.leading,-15)
                .padding(.trailing,40)
            TextField("N/A",text: $inputString, prompt: Text(placeholderText).foregroundColor(.white)).foregroundColor(.white)
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
        CustomTextfield(inputString: .constant("Manni"))
    }
}
