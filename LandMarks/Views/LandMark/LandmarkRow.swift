//
//  LandmarkRow.swift
//  LandMarks
//
//  Created by abhishek on 27/03/23.
//

import SwiftUI

struct LandmarkRow: View {
    
    //MARK: - Properties
    var landmark : Landmark
    //MARK: - View Builder
    var body: some View {
        HStack{
            landmark.image
                .resizable()
                .frame(width: 100, height: 90)
            Text(landmark.name)
                .foregroundColor(.black)
                .font(.title3)
                .padding(5)
               Spacer()
              Image("star")
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }

        
    }
}
//MARK: - Previews
struct LandmarkRow_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    static var previews: some View {
        Group {
                LandmarkRow(landmark: landmarks[0])
                LandmarkRow(landmark: landmarks[1])
            }
        .previewLayout(.fixed(width: 350, height: 90))
    }
}
