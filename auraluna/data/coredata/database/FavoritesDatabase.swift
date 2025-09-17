import Foundation
import CoreData

struct FavoritesDatabase {
    
    static let shared = FavoritesDatabase()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "FavoriteModel")
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Error: \(error)")
            }
        }
    }

    var context: NSManagedObjectContext {
        container.viewContext
    }
    
}

