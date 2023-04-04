//
//  AudioImageVierw.swift
//  MusicApp
//
//  Created by abhishek on 05/04/23.
//

import SwiftUI

struct AudioImageView: View {
    var body: some View {
        Image("juja-han-uT55XxQLQGU-unsplash")
            .resizable()
            .frame(width: 250,height: 250)
            .scaledToFit()
            .clipShape(Circle())
    }
}

struct AudioImageVierw_Previews: PreviewProvider {
    static var previews: some View {
        AudioImageView()
    }
}
