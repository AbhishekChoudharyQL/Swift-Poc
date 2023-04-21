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
                .background(.gray.opacity(0.30))
                .cornerRadius(10)
                .padding()
                .frame(height: UIScreen.main.bounds.height/2)
                   
               //MARK: - Setting UP Title
                Text(page.title)
                .font(.largeTitle)
                .italic()
                .bold()
                .padding()
                .foregroundColor(AppColor.sliderAccentColor)
            
               //MARK: - Setting Up Page Description
                Text(page.description)
                .font(.title2)
                .frame(width: 300)
                .foregroundColor(.indigo)
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
