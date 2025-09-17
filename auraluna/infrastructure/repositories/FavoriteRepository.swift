import Foundation

class FavoriteRepository: FavoriteRepositoryI {
    
    private let datasource: FavoriteDatasourceI
    private let mapper: FavoriteMapper
    
    init(datasource: FavoriteDatasourceI, mapper: FavoriteMapper) {
        self.datasource = datasource
        self.mapper = mapper
    }
    
    func insert(favorite: Favorite) async {
        do {
            return
        }
        catch {
            return
        }
    }
    
    func getAll() async -> [Favorite] {
        do {
            return []
        }
        catch {
            return []
        }
    }
    
    func getById(audioId: Int) async -> Favorite? {
        do {
            return nil
        }
        catch {
            return nil
        }
    }
    
    func delete(favorite: Favorite) async {
        do {
            return
        }
        catch {
            return
        }
    }
}
