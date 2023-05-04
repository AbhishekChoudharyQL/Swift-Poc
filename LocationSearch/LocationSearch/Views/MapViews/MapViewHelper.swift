//
//  MapViewHelper.swift
//  LocationSearch
//
//  Created by abhishek on 04/05/23.
//

import SwiftUI
import MapKit

struct MapViewHelper : UIViewRepresentable {
    
    //MARK: - Properties
    @EnvironmentObject var locationManager : LocationManager
    
        //MARK: - UIView Representable Methods
    func makeUIView(context: Context) -> MKMapView{
        return locationManager.mapView
    }
    func updateUIView(_ uiView: MKMapView, context: Context) {}
}
