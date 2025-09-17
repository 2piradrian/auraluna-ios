import Foundation
import CoreData

struct FavoriteMapper {
    
    private let context: NSManagedObjectContext
        
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func toDomain(model: FavoriteModel) -> Favorite {
        return Favorite(
            id: Int(model.id),
            audioId: Int(model.audioId),
            name: model.name ?? "",
            author: model.author ?? ""
        )
    }
    
    func toModel(domain: Favorite) -> FavoriteModel {
        let favorite = FavoriteModel(context: context)
        
        favorite.id = Int64(domain.id)
        favorite.audioId = Int64(domain.audioId)
        favorite.name = domain.name
        favorite.author = domain.author
        
        return favorite
    }
    
}
