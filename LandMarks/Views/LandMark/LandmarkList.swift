//
//  LandmarkList.swift
//  LandMarks
//
//  Created by abhishek on 27/03/23.
//

import SwiftUI

struct LandmarkList: View {
    //MARK: - @State Variable
    @State private var showOnlyFavorite = true
    //MARK: - @EnvironmentObject
    @EnvironmentObject var modelData : ModelData
    //MARK: - Computed Property
    var filteredLandmarks : [Landmark] {
        modelData.landmarks.filter {
            landmark in
            (!showOnlyFavorite || landmark.isFavorite  )
            
        }
    }
    //MARK: - View Builder
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showOnlyFavorite){    // use the $ prefix to access a binding to a state variable, or one                                       of its properties.
                    Text("Favourite Only")
                }
               
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {                                 // whats the use of label here??
                        LandmarkRow(landmark: landmark)
                    }
                }
                .navigationTitle("Landmarks")
            }
        }
    }
}
//MARK: - Previews
struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
            LandmarkList()
            .environmentObject(ModelData())
        }
    }

