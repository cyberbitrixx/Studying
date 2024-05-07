//
//  Customer+CoreDataClass.swift
//  SortingFilteringMenu
//
//  Created by sofia on 11.06.2023.
//
//

import Foundation
import CoreData

@objc(Customer)
public class Customer: NSManagedObject {
//    filters database and returns customer with specific name or returns nil if no such name is found
    public func with(fullName: String,
                     _ context: NSManagedObjectContext) -> Customer? {
        let request = Customer.fetchRequest()
        
        let predicate = NSPredicate(format: "fullName CONTAINS[cd] %@", fullName)
        request.predicate = predicate
        
        do {
            guard let results = try context.fetch(request) as? [Customer], results.count > 0 else { return nil }
            return results.first
        } catch(let error) {
            print(error.localizedDescription)
            return nil
        }
    }

}

public let customer = Customer()

extension Customer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Customer> {
        return NSFetchRequest<Customer>(entityName: "Customer")
    }

    @NSManaged public var email: String?
    @NSManaged public var fullName: String?
    @NSManaged public var toDessert: NSSet?

}

// MARK: Generated accessors for toDessert
extension Customer {

    @objc(addToDessertObject:)
    @NSManaged public func addToToDessert(_ value: Dessert)

    @objc(removeToDessertObject:)
    @NSManaged public func removeFromToDessert(_ value: Dessert)

    @objc(addToDessert:)
    @NSManaged public func addToToDessert(_ values: NSSet)

    @objc(removeToDessert:)
    @NSManaged public func removeFromToDessert(_ values: NSSet)

}

extension Customer : Identifiable {

}
