//
//  CounterViewModel.swift
//  newcounter
//
//  Created by abhishek on 03/03/23.
//

import Foundation

class CounterViewModel {
    //MARK: - Properties
    var counter : Int = 0
    var limit: Int = 10    // deafault value of 10 is given to limit
    
    //MARK: - Public Methods
    public func getUpdatedCounterValue(for counterValue: CounterValue) -> String {
        switch counterValue {
        case .increment:
            counter = counter + 1  // increment counter here
            if counter > limit {   // if counter increase beyond limit then set again to 0
                counter = 0
            }
            
            return "\(counter)"
            
        case .decrement:
            counter = counter - 1   // counter will be decremented
            if counter == limit {   // if counter is less than minimum limit again set to 0
                counter = 0
            }
            
            return "\(counter)"
        }
    }
    
}
