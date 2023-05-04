//
//  LocationManager.swift
//  LocationSearch
//
//  Created by abhishek on 03/05/23.
//

import SwiftUI
import MapKit
import CoreLocation
import Combine           //MARK:  Combine frame to watch searchText

class LocationManager : NSObject,ObservableObject, MKMapViewDelegate, CLLocationManagerDelegate {
    
    //MARK: - Properties
    @Published var mapView : MKMapView = .init()
    @Published var manager : CLLocationManager = .init()
    @Published var searchText : String = ""
    @Published var fetchedPlaces : [CLPlacemark]?
    @Published var userLocation : CLLocation?
    var cancelleable : AnyCancellable?
    //MARK: Final Location
    @Published var pickedLocation : CLLocation?
    @Published var pickedPlaceMark : CLPlacemark?
    
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
            .sink(receiveValue: { [self]
                value in
                if value != ""{
                    self.fetchPlaces(value: value)
                } else {
                    self.fetchedPlaces = nil
                }
            })
       }
    
    //MARK: - Methods
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
            } catch {
                print("Error caught")
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        // error handle krege idhar
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let currentLocation = locations.last else {return}
        self.userLocation = currentLocation
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
    
    func handleLocationError() {}
    
    //MARK: Add Draggable pin to mapview..
    func addDraggablePin(coordinates : CLLocationCoordinate2D){
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinates
        annotation.title = "Selected Location"
        mapView.addAnnotation(annotation)
    }
    
    //MARK: Enable Dragging
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let marker = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "Delivery Pin")
        marker.isDraggable = true
        marker.canShowCallout = false
        return marker
    }
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, didChange newState: MKAnnotationView.DragState, fromOldState oldState: MKAnnotationView.DragState) {
        guard let newLocation = view.annotation?.coordinate else {return}
        self.pickedLocation = .init(latitude: newLocation.latitude, longitude: newLocation.longitude)
    }
}
