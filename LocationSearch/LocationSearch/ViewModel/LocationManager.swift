//
//  LocationManager.swift
//  LocationSearch
//
//  Created by abhishek on 03/05/23.
//

import SwiftUI
import MapKit
import CoreLocation
//MARK:  Combine frame to watch searchText
import Combine

class LocationManager : NSObject,ObservableObject, MKMapViewDelegate, CLLocationManagerDelegate {
    
    //MARK: - Properties
    @Published var mapView : MKMapView = .init()
    @Published var manager : CLLocationManager = .init()
    @Published var searchText : String = ""
    @Published var fetchedPlaces : [CLPlacemark]?
    var cancelleable : AnyCancellable?
    
    override init() {
        super.init()
        //MARK: Setting delegates
        mapView.delegate = self
        manager.delegate = self
        //MARK: Requesting Location Access
        manager.requestWhenInUseAuthorization()
        //MARK: Search TextField watching
        cancelleable = $searchText
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .sink(receiveValue: {
                value in
                if value != ""{
                    self.fetchPlaces(value: value)
                } else {
                    self.fetchedPlaces = nil
                }
                
            })
    }
    func fetchPlaces(value: String){
     //MARK: Fetching places using MKLocalSearch & Asyn/Await
        Task{
            do {
                let request = MKLocalSearch.Request()
                request.naturalLanguageQuery = value.lowercased()
                let response = try await MKLocalSearch(request: request).start()
                await MainActor.run(body: {
                    self.fetchedPlaces = response.mapItems.compactMap({
                        item -> CLPlacemark? in
                        
                        return item.placemark
                    })
                })
            }
        }
        
    }
    
    //MARK: - Methods
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        // Handle error here
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let _ = locations.last else {return}
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
