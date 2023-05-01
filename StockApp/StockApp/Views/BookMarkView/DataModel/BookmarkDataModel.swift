//
//  BookmarkDataModel.swift
//  StockApp
//
//  Created by abhishek on 01/05/23.
//

import Foundation
import CoreData

class BookmarkDataModel : ObservableObject {
    let container = NSPersistentContainer(name: "StockModel")
    
    init() {
        container.loadPersistentStores {
            description , error in
            if let error = error {
                print("Failed to load data in datamodel \(error.localizedDescription)")
            }
        }
    }
    
    func save(Context : NSManagedObjectContext){
        do {
            try Context.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError),\(nsError.userInfo)")
        }
    }
    
    func addStocks(name : String , currentPrice : Double, context : NSManagedObjectContext){
        let stockData = StockData(context: context)
        stockData.id = UUID()
        stockData.name = name
        stockData.currentPrice = currentPrice
        save(Context: context)
    }
}

