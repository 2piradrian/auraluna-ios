import Foundation

protocol FavoritesRepositoryI {
    
    func insert(_ favorite: Favorite) async
    
    func getAll() async -> [Favorite]
    
    func getById(_ audioId: Int) async -> Favorite?
    
    func delete(_ favorite: Favorite) async
    
}
