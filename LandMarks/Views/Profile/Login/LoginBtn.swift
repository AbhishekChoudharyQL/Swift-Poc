//
//  LoginBtn.swift
//  LandMarks
//
//  Created by abhishek on 30/03/23.
//

import SwiftUI

struct LoginBtn: View {
    var body: some View {
           Text("Login")
                       .font(.headline)
                       .foregroundColor(.white)
                       .padding()
                       .frame(width: 200, height: 50)
                       .background(Color.init(red: 242/255, green: 130/255, blue: 31/255))
                       .background(Color.orange)
                       .cornerRadius(15.0)
        
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        LoginBtn()
    }
}
