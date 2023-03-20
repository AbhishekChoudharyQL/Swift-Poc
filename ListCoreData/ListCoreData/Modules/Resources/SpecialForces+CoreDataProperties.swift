//
//  SpecialForces+CoreDataProperties.swift
//  ListCoreData
//
//  Created by abhishek on 15/03/23.
//
//

import Foundation
import CoreData


extension SpecialForces {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SpecialForces> {
        return NSFetchRequest<SpecialForces>(entityName: "SpecialForces")
    }

    @NSManaged public var name: String?

}

extension SpecialForces : Identifiable {

}
