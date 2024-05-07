//: [Previous](@previous)

import Foundation
import CoreData
import UIKit

@main
class App: UIResponder, UIApplicationDelegate {
    //    other code goes here
    
    //    creating Persistent Container (to access Managed Obgect Context in Storage Manager)
    //    MARK: - code below represents a link to Persistent Container
    lazy let container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreData")
        container.loadPersistentStores { description, error in
            if let error {
                print(error.localizedDescription)
            }
            else {
                print("DB url - ", description.url?.absoluteString)
            }
        }
        return container()
    }()
    
//    MARK:     Container - is an object, stored on Hard Drive.
//    MARK:     Context - copy/cast of data objects from database, which are being managed/modified etc. within RAM at the                  moment.
//    MARK:     function below is needed to save new version of data into the database after modifying it in RAM.
//    MARK: - THIS FUNSTION IS CRUCIAL FOR UPDATING DATABASE.
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            try context.save()
        } catch {
            let error = error as? NSError
            fatalError(error?.localizedDescription)
        }
    }
}

//: [Next](@next)
