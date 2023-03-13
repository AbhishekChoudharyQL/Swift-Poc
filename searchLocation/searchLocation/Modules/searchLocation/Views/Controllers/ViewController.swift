//
//  ViewController.swift
//  searchLocation
//
//  Created by abhishek on 10/03/23.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate  {
//MARK: IBOUtlets
    @IBOutlet weak var myTable: UITableView!
    @IBOutlet weak var myMap: MKMapView!
    @IBOutlet weak var mapHeightConstraint: NSLayoutConstraint!

 
//MARK: PROPERTIES
    var filteredStateArray : [IndiaStatesDataModel]?
    var isFiltering = false
    let regionInMeters: Double = 1000
    var selectedLattitude : Double = 28.5355
    var selectedLongitude : Double = 77.3910
    let locationManager = CLLocationManager()
    var coordinates: [CLLocation] = []
    //var selectedLocation : CLLocation
    


   
 //MARK: LIFECYCLE METHODS
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //title = "MAPKIT"
        myTable.dataSource = self
        myTable.delegate =  self
        configSeacrhbar()
        
      let cellnib = UINib(nibName: "myTableViewCell", bundle: nil)
        myTable.register(cellnib, forCellReuseIdentifier: "myTableViewCell")
        
        mapHeightConstraint.constant = UIScreen.main.bounds.width

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)       // setting up of location manager
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }
    
    // MARK: PUBLIC METHODS
   public func configSeacrhbar(){
        let mySearchController = UISearchController() // configuring seacrh bar...
        self.navigationItem.searchController = mySearchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        mySearchController.searchResultsUpdater = self
        mySearchController.obscuresBackgroundDuringPresentation = false
        mySearchController.searchBar.enablesReturnKeyAutomatically = false
        mySearchController.searchBar.placeholder = "Search States"
        mySearchController.searchBar.sizeToFit()
        definesPresentationContext = true
        mySearchController.searchBar.tintColor = UIColor.orange
    
    }
    
   public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {

//        let center = CLLocationCoordinate2D(latitude: selectedLattitude, longitude: selectedLongitude)
//        let region = MKCoordinateRegion.init(center: center, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
//                myMap.setRegion(region, animated: true)
            //locationManager.stopUpdatingLocation()
            render(location)

        }
    }
    
    
   public  func render(_ location : CLLocation){
        let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        print(coordinate.longitude)
        print(coordinate.latitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        myMap.setRegion(region, animated: true)

        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        myMap.addAnnotation(pin)

    }
        
}

//MARK: EXTENSIONS
extension  ViewController : UITableViewDataSource ,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredStateArray?.count ?? 1
        }
            return stateArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myTableViewCell =  myTable.dequeueReusableCell(withIdentifier: "myTableViewCell", for: indexPath) as! myTableViewCell
        
        if isFiltering{
            //myTableViewCell.stateNameLabel?.text = filteredStateArray?[indexPath.row].stateName
            
            myTableViewCell.stateData = filteredStateArray?[indexPath.row]
        } else{
            //cell.stateNameLabel?.text = stateArray[indexPath.row]
            //myTableViewCell.stateNameLabel?.text = stateArray[indexPath.row].stateName
            myTableViewCell.stateData = stateArray[indexPath.row]
        }
        
        return myTableViewCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedLattitude = stateArray[indexPath.row].lattitude
        selectedLongitude = stateArray[indexPath.row].longitude
       
        let locationSelected = CLLocation(latitude: selectedLattitude, longitude: selectedLongitude)
        render(locationSelected)
        print("\(stateArray[indexPath.row].stateName)" + " " + "is selected")
    }
    
}
extension ViewController : UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        myTable.tableHeaderView = searchController.searchBar
        if let searchText = searchController.searchBar.text, !(searchText.isEmpty) {
            isFiltering = true
            filteredStateArray = stateArray.filter({$0.stateName.hasPrefix(searchText)})
        } else {
            filteredStateArray = stateArray
        
            }
            myTable.reloadData()
        }
    }
            
    
        
        
        
        


    

