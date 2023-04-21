//
//  DefaultPlaceholderImage.swift
//  MusicApp
//
//  Created by abhishek on 17/04/23.
//

import SwiftUI

struct DefaultPlaceholderImage: View {
    //MARK: - View Builder
    var body: some View {
        Image(systemName: "person.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 100, height: 100)
    }
}

 //MARK: - Previews
struct DefaultPlaceholderImage_Previews: PreviewProvider {
    static var previews: some View {
        DefaultPlaceholderImage()
    }
}
