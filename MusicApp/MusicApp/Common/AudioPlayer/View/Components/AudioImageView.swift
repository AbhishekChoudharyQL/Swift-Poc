//
//  AudioImageVierw.swift
//  MusicApp
//
//  Created by abhishek on 05/04/23.
//

import SwiftUI

struct AudioImageView: View {
    
    //MARK: - View Builder
    var body: some View {
        Image("music")
            .resizable()
            .frame(width: 220,height: 200)
            .scaledToFill()
//            .clipShape(Circle())
            .padding(.top,50)
    }
}

//MARK: - Previews
struct AudioImageVierw_Previews: PreviewProvider {
    static var previews: some View {
        AudioImageView()
    }
}
