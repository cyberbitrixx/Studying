//
//  Dish+CoreDataClass.swift
//  Core-Data-exercise
//
//  Created by sofia on 25.05.2023.
//
//

import Foundation
import CoreData

@objc(Dish)
public class Dish: NSManagedObject {

}

extension Dish {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Dish> {
        return NSFetchRequest<Dish>(entityName: "Dish")
    }

    @NSManaged public var price: Float
    @NSManaged public var size: String?
    @NSManaged public var name: String?
    @NSManaged public var fromCustomer: [Customer]?

}

extension Dish : Identifiable {

}
