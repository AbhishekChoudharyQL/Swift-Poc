//
//  LogoView.swift
//  MusicApp
//
//  Created by abhishek on 17/04/23.
//

import SwiftUI

struct LogoView: View {
    var imageName : String = "onbeats-logo"
    var body: some View {
        HStack( content: {
            Image(imageName)
                .resizable()
                .scaledToFit()
        })
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
    }
}
