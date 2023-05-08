//
//  WelcomeView.swift
//  FirebaseLoginSignUp
//
//  Created by abhishek on 08/05/23.
//

import SwiftUI

struct WelcomeView: View {
    var userName: String
    var email: String
    
    var body: some View {
        VStack {
            Text("Welcome, \(userName)!")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 20)
            
            Text("Email: \(email)")
                .font(.headline)
                .padding(.bottom, 10)
            
            // Add any other content you want to display on the welcome screen
            
            Spacer()
        }
        .padding()
    }
}
