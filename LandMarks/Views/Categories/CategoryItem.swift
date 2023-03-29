//
//  CategoryItem.swift
//  LandMarks
//
//  Created by abhishek on 29/03/23.
//

import SwiftUI

struct CategoryItem: View {
    //MARK: - Properties
     var landmark : Landmark
    //MARK: - View Builder
    var body: some View {
        VStack(alignment: .leading) {
            CircleImage(image: landmark.image)
                .frame(width: 125,height: 125)
                Text(landmark.name)
                .font(.title3)
                .foregroundColor(.primary)
        }
        .padding()
        .padding(.leading,10)
    }
}
//MARK: - Previews
struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(landmark: ModelData().landmarks[0])
    }
}
