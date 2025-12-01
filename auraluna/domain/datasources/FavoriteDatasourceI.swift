import Foundation

protocol FavoriteDatasourceI {
    
    func insert(favorite: Favorite) async throws
    
    func getAll() async throws -> [FavoriteModel]
    
    func getById(audioId: Int) async throws -> FavoriteModel?
    
    func delete(favorite: Favorite) async throws
}
