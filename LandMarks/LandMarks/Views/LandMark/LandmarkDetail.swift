//
//  LandmarkDetail.swift
//  LandMarks
//
//  Created by abhishek on 27/03/23.
//

import SwiftUI

//struct x : Identifiable {
//    let id: UUID = UUID()
//
//    var manni: String
//}
 // just for refrence code given by Manni Sir.


struct LandmarkDetail: View {
    //MARK: - Properties 
    @EnvironmentObject var modelData : ModelData
    var landmark: Landmark
    var landmarkIndex: Int {
            modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
        }

    var body: some View {
        ScrollView {
            MapView(coordinates: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)

            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)

            VStack(alignment: .leading) {
                
                Text(landmark.name)
                    .font(.title)
                FavouriteBtn(isSet: $modelData.landmarks[landmarkIndex].isFavorite)

                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundColor(.blue)

                Divider()

                Text("About \(landmark.name)")
                    .font(.headline)
                Text(landmark.description)
                    .foregroundColor(.black)
                    .opacity(0.7)
            }
            .padding()
            
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.large)
        
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
     
    static var previews: some View {
        LandmarkDetail(landmark: ModelData().landmarks[0])  // why first element is taken here ??
    }
}
