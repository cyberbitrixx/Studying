//
//  StorageManager.swift
//  Core-Data-exercise
//
//  Created by sofia on 25.05.2023.
//

import Foundation
import CoreData
import UIKit

// MARK: - CRUD (Create, Update, Read, Delete)

public final class CoreDataManager: PersistentContainerProvider {
//    singletone to make sure we will have only one instance of CoreDataManager within the project and to encapsulate all the Core Data management within one unit (class). A good OOP practice
    public static let shared = CoreDataManager()
//    accessing the container
    public let persistentContainer: NSPersistentContainer
    
//    create context
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
        
        private init() {
            self.persistentContainer = NSPersistentContainer(name: "Core_Data_exercise")
            self.persistentContainer.loadPersistentStores { _, error in
                if let error = error as NSError? {
                    fatalError(error.localizedDescription)
                }
            }
        }
    
//    saving the context
    public func saveContext() {
        guard context.hasChanges else {
            return
        }
        
        do {
            try context.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    // CREATE
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
}


//    globally finding the app's persistent controller in the memory through implementation of this protocol
protocol PersistentContainerProvider {
    var persistentContainer: NSPersistentContainer { get }
}

extension PersistentContainerProvider {
    var persistentContainer: NSPersistentContainer {
        let container = NSPersistentContainer(name: "Core_Data_exercise")
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
                           return container
    }
}


