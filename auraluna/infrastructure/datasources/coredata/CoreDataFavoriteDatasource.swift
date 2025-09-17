import Foundation
import CoreData

class CoreDataFavoriteDatasource: FavoriteDatasourceI {
    
    private let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext = FavoritesDatabase.shared.context) {
        self.context = context
    }
    
    func insert(favorite: Favorite) async {
        await context.perform {
            
            let model = FavoriteModel(context: self.context)
            model.id = Int64(favorite.id)
            model.audioId = Int64(favorite.audioId)
            model.name = favorite.name
            model.author = favorite.author
            
            do {
                try self.context.save()
            }
            catch {
                print("Error: \(error)")
            }
            
        }
    }
    
    func getAll() async -> [FavoriteModel] {
        await context.perform {
            
            let request: NSFetchRequest<FavoriteModel> = FavoriteModel.fetchRequest()
            
            do {
                return try self.context.fetch(request)
            }
            catch {
                print("Error: \(error)")
                return []
            }
        }
    }
    
    func getById(audioId: Int) async -> FavoriteModel? {
        await context.perform {
            
            let request: NSFetchRequest<FavoriteModel> = FavoriteModel.fetchRequest()
            request.predicate = NSPredicate(format: "audioId == %d", audioId)
            request.fetchLimit = 1
            
            do {
                return try self.context.fetch(request).first
            }
            catch {
                print("Error: \(error)")
                return nil
            }
        }
    }
    
    func delete(favorite: Favorite) async {
        await context.perform {
            
            let request: NSFetchRequest<FavoriteModel> = FavoriteModel.fetchRequest()
            request.predicate = NSPredicate(format: "id == %d", favorite.id)
            
            do {
                let models = try self.context.fetch(request)
                for model in models {
                    self.context.delete(model)
                }
                try self.context.save()
            }
            catch {
                print("Error: \(error)")
            }
        }
    }
}
