import Foundation
import CoreData

final class CoreDataFavoriteDatasource: FavoriteDatasourceI, @unchecked Sendable {
    
    private let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext = FavoritesDatabase.shared.context) {
        self.context = context
    }
    
    func insert(favorite: Favorite) async throws {
        try await context.perform {
            let model = FavoriteModel(context: self.context)
            model.id = Int64(favorite.id)
            model.audioId = Int64(favorite.audioId)
            model.name = favorite.name
            model.author = favorite.author
            
            try self.context.save()
        }
    }
    
    func getAll() async throws -> [FavoriteModel] {
        try await context.perform {
            let request: NSFetchRequest<FavoriteModel> = FavoriteModel.fetchRequest()
            return try self.context.fetch(request)
        }
    }
    
    func getById(audioId: Int) async throws -> FavoriteModel? {
        try await context.perform {
            let request: NSFetchRequest<FavoriteModel> = FavoriteModel.fetchRequest()
            request.predicate = NSPredicate(format: "audioId == %d", audioId)
            request.fetchLimit = 1
            
            return try self.context.fetch(request).first
        }
    }
    
    func delete(favorite: Favorite) async throws {
        try await context.perform {
            let request: NSFetchRequest<FavoriteModel> = FavoriteModel.fetchRequest()
            request.predicate = NSPredicate(format: "id == %d", favorite.id)
            
            let models = try self.context.fetch(request)
            
            for model in models {
                self.context.delete(model)
            }
            
            try self.context.save()
        }
    }
    
}
