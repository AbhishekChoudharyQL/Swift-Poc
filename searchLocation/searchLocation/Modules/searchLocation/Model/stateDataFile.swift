//
//  stateDataFile.swift
//  searchLocation
//
//  Created by abhishek on 13/03/23.
//

import Foundation
import UIKit
import CoreLocation

//MARK: Properties
struct IndiaStatesDataModel {
    var stateName : String
    var longitude : Double
    var lattitude : Double
}

var stateArray : [IndiaStatesDataModel] = [IndiaStatesDataModel(stateName: "New Delhi", longitude: 28.6139, lattitude: 28.6139),
                            IndiaStatesDataModel(stateName: "Uttar Pradesh", longitude:79.826660 , lattitude: 28.207609),
                            IndiaStatesDataModel(stateName: "Haryana", longitude: 76.431885, lattitude:29.238478),
                            IndiaStatesDataModel(stateName: "Uttrakhand", longitude: 80.0982, lattitude: 27.5706),
                            IndiaStatesDataModel(stateName: "Punjab", longitude: 75.3412, lattitude: 31.1471),
                            IndiaStatesDataModel(stateName: "Rajasthan", longitude: 73.432617, lattitude: 27.391277),
                            IndiaStatesDataModel(stateName: "Himachal Pradesh", longitude: 77.571167, lattitude:32.084206),
                            IndiaStatesDataModel(stateName: "Goa", longitude: 74.1240, lattitude: 15.2993),
                            IndiaStatesDataModel(stateName: "Gujarat", longitude: 71.5724, lattitude: 22.6708),
                            IndiaStatesDataModel(stateName: "Maharahtra", longitude: 75.7139, lattitude: 19.7515),
                            IndiaStatesDataModel(stateName: "Karnataka", longitude: 75.7139, lattitude: 15.3173),
                            IndiaStatesDataModel(stateName: "Madhya Pradesh", longitude: 78.6569, lattitude: 22.9734),
                            IndiaStatesDataModel(stateName: "Assam", longitude: 92.9376, lattitude: 26.2006),
                            IndiaStatesDataModel(stateName: "Tamil Nadu", longitude: 78.387451, lattitude: 11.059821),
                            IndiaStatesDataModel(stateName: "West Bengal", longitude: 87.8550, lattitude: 22.9868)
    
                            ]
    // Array of Model data type to store name , lattitude and longitude of States.
