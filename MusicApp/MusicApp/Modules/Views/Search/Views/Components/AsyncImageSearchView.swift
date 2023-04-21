//
//  AsyncImageSearchView.swift
//  MusicApp
//
//  Created by abhishek on 22/04/23.
//

import SwiftUI

struct AsyncImageSearchView: View {
    //MARK: - Properties
    let imageUrl : URL
    
    //MARK: - View Builder
    var body: some View {
        AsyncImage(url: imageUrl) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
        } placeholder: {
            Image(systemName: "person.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
        }
    }
}

 //MARK: - Previews
struct AsyncImageSearchView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageSearchView(imageUrl: URL(string: "https//")!)
    }
}
