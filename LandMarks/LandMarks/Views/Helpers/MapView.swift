//
//  MapView.swift
//  LandMarks
//
//  Created by abhishek on 24/03/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    //MARK: - Properties
    var coordinates : CLLocationCoordinate2D
    
    //MARK: - State Variables
    @State private var region = MKCoordinateRegion ()
  
    
    var body: some View {
        Map(coordinateRegion: $region)                    // need to ask about this ....
            .onAppear {
                setRegion(coordinates)
            }
    }
    
    //MARK: - Private Methods
    private func setRegion (_ coordinates : CLLocationCoordinate2D){
        region = MKCoordinateRegion(
          center: coordinates,
          span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }

}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinates: CLLocationCoordinate2D(latitude: 29.5300, longitude: 78.7747))
    }
}
