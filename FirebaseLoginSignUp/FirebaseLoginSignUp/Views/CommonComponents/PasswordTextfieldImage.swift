//
//  PasswordTextfieldImage.swift
//  FirebaseLoginSignUp
//
//  Created by abhishek on 05/05/23.
//

import SwiftUI

struct PasswordTextfieldImage: View {
    //MARK: - Properties
    var body: some View {
        Circle()
            .fill(Color.white)
            .frame(height: 65)
            .overlay(
                Image(systemName: "key")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .foregroundColor(.pink)
          )
    }
}

//MARK: -  Previews
struct PasswordTextfieldImage_Previews: PreviewProvider {
    static var previews: some View {
        PasswordTextfieldImage()
    }
}
