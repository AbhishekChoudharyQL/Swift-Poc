//
//  LoginBtn.swift
//  LandMarks
//
//  Created by abhishek on 30/03/23.
//

import SwiftUI

struct RegisterBtn: View {
    var body: some View {
        Text("Register")
                       .font(.headline)
                       .foregroundColor(.white)
                       .padding()
                       .frame(width: 200, height: 50)
                       .background(Color.mint)
                       .cornerRadius(15.0)
       
    }
}

struct Register_Previews: PreviewProvider {
    static var previews: some View {
        RegisterBtn()
    }
}
