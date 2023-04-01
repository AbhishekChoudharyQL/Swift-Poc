//
//  RegisterTitle.swift
//  LandMarks
//
//  Created by abhishek on 30/03/23.
//

import SwiftUI

struct RegisterTitle: View {
    var body: some View {
        Text("Register To Continue")
            .font(.largeTitle)
            .foregroundColor(Color.white)
            .fontWeight(.bold)
            .padding()
//            .border(.mint,width: 4)
//            .foregroundColor(.white)
//            .background(Color.white)
//            .cornerRadius(18)
            .padding(.bottom, 20)
            
        
    }
}

struct RegisterTitle_Previews: PreviewProvider {
    static var previews: some View {
        RegisterTitle()
    }
}
