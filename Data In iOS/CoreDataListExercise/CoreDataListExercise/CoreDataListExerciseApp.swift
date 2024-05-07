//
// CoreDataListExerciseApp.swift



import SwiftUI
import CoreData

// app entry point
@main
struct CoreDataListExerciseApp: App {
    let persistenceController = PersistenceController.shared
    
    init() {
        Dessert.deleteAll(persistenceController.container.viewContext)
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
