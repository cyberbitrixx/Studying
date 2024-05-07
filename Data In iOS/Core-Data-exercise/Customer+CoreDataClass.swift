//
//  Customer+CoreDataClass.swift
//  Core-Data-exercise
//
//  Created by sofia on 25.05.2023.
//
//

import Foundation
import CoreData

@objc(Customer)
public class Customer: NSManagedObject {

}

extension Customer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Customer> {
        return NSFetchRequest<Customer>(entityName: "Customer")
    }

    @NSManaged public var email: String?
    @NSManaged public var fullName: String?
    @NSManaged public var toDish: Dish?

}

extension Customer : Identifiable {

}
