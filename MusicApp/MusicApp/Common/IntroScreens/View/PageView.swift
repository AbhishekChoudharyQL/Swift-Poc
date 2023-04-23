//
//  PageView.swift
//  MusicApp
//
//  Created by abhishek on 07/04/23.
//

import SwiftUI

struct PageView: View {
    //MARK: - Properties
    var page : Page
    
    //MARK: - View Builder
    var body: some View {
        VStack(spacing: 10) {
            //MARK: - Setting Up Image
                Image("\(page.imageUrl)")
                .resizable()
                .scaledToFit()
                .padding()
                .cornerRadius(30)
                .background(AppColor.greenSpotify.opacity(0.40))
                .cornerRadius(10)
                .padding()
                .frame(height: UIScreen.main.bounds.height/2)
                   Spacer()
               //MARK: - Setting UP Title
                Text(page.title)
                .font(.largeTitle)
                .font(.system(size: 46))
                .italic()
                .bold()
                .padding()
                .foregroundColor(AppColor.greenSpotify)
            
               //MARK: - Setting Up Page Description
                Text(page.description)
                .font(.title2)
                .frame(width: 300)
                .foregroundColor(AppColor.greenSpotify)
                .padding()
                .bold()
        }
            
    }
}

 //MARK: - Previews
struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(page: Page.samplePage)
    
    }
}
