//
//  SearchViewNavigationTitle.swift
//  LocationSearch
//
//  Created by abhishek on 03/05/23.
//

import SwiftUI

struct SearchViewNavigationTitle: View {
    
    //MARK: - View Builder
    var body: some View {
        HStack(spacing: 15, content: {
                    Button{
                        print("tapped")
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.title3)
                            .foregroundColor(.white)
                    }
                    Text("Search Location")
                        .foregroundColor(.white)
                        .font(.title3)
                        .fontWeight(.bold)
            }).frame(maxWidth: .infinity,alignment: .leading)
    }
}

//MARK: - Previews
struct SearchViewNavigationTitle_Previews: PreviewProvider {
    static var previews: some View {
        SearchViewNavigationTitle()
    }
}
