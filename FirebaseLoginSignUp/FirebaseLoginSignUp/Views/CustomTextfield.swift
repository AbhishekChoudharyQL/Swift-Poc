//
//  CustomTextfield.swift
//  FirebaseLoginSignUp
//
//  Created by abhishek on 05/05/23.
//

import SwiftUI

struct CustomTextfield: View {
    var imageName : String = ""
    var placeholderText : String = ""
   @State var promptString : String
    var body: some View {
        HStack(content: {
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 35)
                .foregroundColor(.white)
                .padding(.leading,20)
                .padding(.trailing,40)
        
                
            TextField("",text: $promptString,prompt: Text(placeholderText).foregroundColor(.white)).foregroundColor(.white)
        }).padding()
            .frame(width: 320)
        .background{
            RoundedRectangle(cornerRadius: 20)
                .strokeBorder(.white)
               
        }
    }
}

struct CustomTextfield_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextfield(promptString: "")
    }
}
