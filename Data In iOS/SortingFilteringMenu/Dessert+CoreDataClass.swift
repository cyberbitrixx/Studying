//
//  Dessert+CoreDataClass.swift
//  SortingFilteringMenu
//
//  Created by sofia on 20.06.2023.
//
//

import Foundation
import CoreData

@objc(Dessert)
public class Dessert: NSManagedObject {
    public func consumedByJohnDoe(_ context: NSManagedObjectContext) -> [Dessert]? {
        guard customer.with(fullName: "John Doe", context) != nil
        else { return nil }
        
        let request = Dessert.fetchRequest()
        let predicate = NSPredicate(format: "ANY fromCustomer == %@", customer)
        request.predicate = predicate
        
        do {
            guard let results = try context.fetch(request) as? [Dessert],
                  results.count > 0
            else { return nil }
            return results
        } catch (let error){
            print(error.localizedDescription)
            return nil
        }
    }

}

extension Dessert {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Dessert> {
        return NSFetchRequest<Dessert>(entityName: "Dessert")
    }

    @NSManaged public var name: String?
    @NSManaged public var price: Float
    @NSManaged public var size: String?
    @NSManaged public var fromCustomer: NSSet?

}

// MARK: Generated accessors for fromCustomer
extension Dessert {

    @objc(addFromCustomerObject:)
    @NSManaged public func addToFromCustomer(_ value: Customer)

    @objc(removeFromCustomerObject:)
    @NSManaged public func removeFromFromCustomer(_ value: Customer)

    @objc(addFromCustomer:)
    @NSManaged public func addToFromCustomer(_ values: NSSet)

    @objc(removeFromCustomer:)
    @NSManaged public func removeFromFromCustomer(_ values: NSSet)

}

extension Dessert : Identifiable {

}
