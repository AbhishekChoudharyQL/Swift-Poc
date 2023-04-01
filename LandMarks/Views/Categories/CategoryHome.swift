//
//  CatgeoryHome.swift
//  LandMarks
//
//  Created by abhishek on 28/03/23.
//

import SwiftUI

struct CategoryHome: View {
    //MARK: - EnvironmentObject
    @EnvironmentObject var modelData : ModelData
    
    //MARK: - View Builder
    var body: some View {
     
        NavigationView {
            List(content: {
                modelData.landmarks[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 290)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                ForEach(modelData.categories.keys.sorted(), id: \.self) {
                    key in
                    CategoryRow(categoryName: key, item: modelData.categories[key]!).background(Color.white)

                }
                .listRowInsets(EdgeInsets())
                .listStyle(PlainListStyle())
            })
            .navigationTitle("Featured")
        }
        .foregroundColor(.blue)
    }
        
}
//MARK: - Previews
struct CatgeoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
