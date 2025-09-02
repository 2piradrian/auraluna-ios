import Foundation

protocol FavoriteDatasourceI {
    
    func insert(favorite: Favorite) async
    
    func getAll() async -> [Favorite]
    
    func getById(audioId: Int) async -> Favorite?
    
    func delete(favorite: Favorite) async
    
}
