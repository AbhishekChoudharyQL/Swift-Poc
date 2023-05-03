//
//  LocationManager.swift
//  LocationSearch
//
//  Created by abhishek on 03/05/23.
//

import SwiftUI
import MapKit
import CoreLocation

class LocationManager : NSObject,ObservableObject, MKMapViewDelegate, CLLocationManagerDelegate {
    @Published var mapView : MKMapView = .init()
    @Published var manager : CLLocationManager = .init()
    @Published var searchText : String = ""
    
    override init() {
        super.init()
        //MARK: Setting delegates
        mapView.delegate = self
        manager.delegate = self
        //MARK: Requesting Location Access
        manager.requestWhenInUseAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        // Handle error here
    }
    //MARK: Location Authorization
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedAlways : manager.requestLocation()
        case .authorizedWhenInUse : manager.requestLocation()
        case .denied : handleLocationError()
        case .notDetermined : manager.requestWhenInUseAuthorization()
        default :  ()
        }
    }
    
    func handleLocationError() {
        
    }
}
