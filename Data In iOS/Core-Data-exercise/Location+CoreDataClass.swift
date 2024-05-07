//
//  Location+CoreDataClass.swift
//  Core-Data-exercise
//
//  Created by sofia on 26.05.2023.
//
//

import Foundation
import CoreData

@objc(Location)
public class Location: NSManagedObject {

}

extension Location {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Location> {
        return NSFetchRequest<Location>(entityName: "Location")
    }

    @NSManaged public var phoneNumber: String?
    @NSManaged public var address: String?

}

extension Location : Identifiable {

}
