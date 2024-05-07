//
//  ContentView.swift
//  Core-Data-exercise
//
//  Created by sofia on 25.05.2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    //    Fetch request to fetch data from database (Core Data) into the app's data model and memory
    @FetchRequest(sortDescriptors: [], animation: .default)
    private var dishes: FetchedResults<Dish>
    
    @FetchRequest(sortDescriptors: [], animation: .default)
    private var locations: FetchedResults<Location>
    
    
    var body: some View {
        
        Button("Create and save entities") {
            createAndSaveEntities()
        }
        
    }
    private func createAndSaveEntities() {
            let newDish = Dish(context: CoreDataManager.shared.context)
            newDish.name = "Apple Pie"
            newDish.size = "Extra Large"
            newDish.price = 10
            
            let newLocation = Location(context: CoreDataManager.shared.context)
            newLocation.address = "9000 Example Road"
            newLocation.phoneNumber = "(212) 555 1234"
            
            let oneCustomer = Customer(context: CoreDataManager.shared.context)
            oneCustomer.fullName = "John Wick"
            oneCustomer.email = "example@gmail.com"

//        establish relationship between Dish and Customer instances (assign dish to cutomer)
            newDish.fromCustomer = [oneCustomer]
            
//        save changes
            CoreDataManager.shared.saveContext()
        }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
