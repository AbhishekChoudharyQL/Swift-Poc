//
//  CategoryRow.swift
//  LandMarks
//
//  Created by abhishek on 28/03/23.
//

import SwiftUI

struct CategoryRow: View {
    
  //MARK: - Properties
    var categoryName : String
    var item : [Landmark]
    var body: some View {
        
        VStack(alignment: .leading){
            Text(categoryName)
                .font(.title)
                .padding(.leading, 15)
                .padding(.top, 15)
            
            ScrollView(.horizontal,showsIndicators: false){
                HStack(alignment: .top, spacing: 0) {
                    ForEach(item) { landmarks in
                        NavigationLink {
                            LandmarkDetail(landmark: landmarks)
                            
                        } label: {           // use of label here??
                            CategoryItem(landmark: landmarks)  // why CategoryItem is not placed inside navigation-Link.
                        }
                       
                    }
                    
                }
            }
            
          
        }.frame(height: 240) // this will give frame size for a row in list not to CategoryItem ....
    }
}
//MARK: - Previews
struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        var landmarks = ModelData().landmarks
        CategoryRow(categoryName: landmarks[0].category.rawValue,
                    item: Array(landmarks.prefix(4)))
    }
}
