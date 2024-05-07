import UIKit

// Dish entity Dish+CoreDataProperties.swift

// before
// declaring a fetchRequest function to retrieve dishes from the database
extension Dish {
    @nonobjc public class
    func fetchRequest() -> NSFetchRequest<Dish> {
        return NSFetchRequest<Dish>(entityName: "Customer")
    }
}


// after
extension Dish {
    private static
    func request() -> NSFetchRequest<NSFetchRequestResult> {
        let request: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: String(describing: Self.self))
        //        create request to remove duplicates from the results
        request.returnsDistinctResults = true
        //        forces the results to be "faults" (a small objects in Core Data which are fetched into memory only if needed)
        request.returnsObjectsAsFaults = true
        return request
    }
}


// searching for a specific customer. This code should be implemented in Customer class
static func with(firstName: String,
                 lastName: String,
                 _ context: NSManagedObjectContext) -> Customer? {
    let request = Customer.request()
//    adds a filter to return only customers matching firstName and lastName
    let prdicate = NSPredicate(format: "firstName == %@ AND lastName == %@", firstName, lastName)
    request.predicate = predicate
    
    do {
//        guard statement returns a Set of Customer and checks if at least one result is returned, returning nil if the conditions fail
//        otherwise the first customer is being returned (line 44)
        guard let results = try context.fetch(request) as? [Customer],
              results.count > 0
        else { return nil }
        return results.first
    }
    //        if the fetch fails, the reason for the error is printed on the console
    catch (let error) {
        print(error.localizedDescription)
        return nil
    }
}
