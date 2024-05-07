import UIKit
import CoreData
import SwiftUI

// Storage Manager file
// MARK: - CRUD

// MARK: - "final" means that this class won't be inherited which makes project build proccess a bit faster
    public final class CoreDataManager: NSObject {
    
//    singletone to make sure we only have one instance of Storage Manager
    public static let shared = CoreDataManager()
    private override init() {}
    
//    MARK: - next step is to create Managed Object Context which can be accessed through Persistent Container
//    for that we need to globally find app's Persistent Container (memory field for app's data)
//        MARK: - AppDelegate here represents the file within the project which plays the role of AppDelegate, but in new XCode project template "AppDelegate" file name is replaced with the name of the project, so the code below should conform to this file's name (for instance ProjectName instead of AppDelegate)
    private var appDelegate: AppDelegate {
        UIApplication.shared.delegate as! AppDelegate
    }
        
//        create context
//        MARK: - create Persistent Container within App Delegate (or similar file) before accessing Managed Object Context
        private var context: NSManagedContext {
            appDelegate.persistentContainer.viewContext
        }
}
// MARK: - after creating context and accessing container we can work with data from database and save modified data to disk

// making Storage Manager conform the CRUD functionality list
// // FETCHING DATA/Create
public func createDish(_ name: String, size: String, price: Float) {
    guard let dishEntityDescription = NSEntityDescription.entity(forEntityName: "Dish", in: context) else {
        return
    }
    let dish = Dish(entity: dishEntityDescription, insertInto: context)
    dish.name = name
    dish.size = size
    dish.price = price
    
    saveContext()
}

public func fetchDishes() -> [Dish]? {
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Dish")
    do {
        return (try? context.fetch(fetchRequest) as? [Dish]) ?? []
    }
}

public func fetchDish(withName name: String) -> Dish? {
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Dish")
    do {
        let dishes = try context.fetch(fetchRequest) as? [Dish]
        return dishes?.first(where: { $0.name == name })
    } catch {
        return nil
    }
}


// create Fetch Request property wrapper
struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(SortDescriptors: [], animation: .default)
    private var dishes = FetchedResults<Dish>
    
    var body: some View {
        NavigationView {
            List(dishes) {
                dish in Text(dish.name ?? "")
            }
        }
    }
