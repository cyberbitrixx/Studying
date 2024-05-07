//
//  Core_Data_exerciseApp.swift
//  Core-Data-exercise
//
//  Created by sofia on 25.05.2023.
//

import SwiftUI

@main
struct Core_Data_exerciseApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
