//
//  LogoView.swift
//  MusicApp
//
//  Created by abhishek on 17/04/23.
//

import SwiftUI

//MARK: - Reusable logo view for home screen
struct LogoView: View {
    //MARK: - Properties
    var imageName : String = "onbeats-logo"
    //MARK: - View Builder
    var body: some View {
        HStack( content: {
            Image(imageName)
                .resizable()
                .scaledToFit()
        })
    }
}
 //MARK: - Previews
struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
    }
}
