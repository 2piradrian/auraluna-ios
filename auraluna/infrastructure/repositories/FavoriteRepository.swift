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
            try await datasource.insert(favorite: favorite)
        }
        catch {
            // Handle error
        }
    }
    
    func getAll() async -> [Favorite] {
        do {
            let models = try await datasource.getAll()
            return models.map { mapper.toDomain(model: $0) }
        }
        catch {
            return []
        }
    }
    
    func getById(audioId: Int) async -> Favorite? {
        do {
            if let model = try await datasource.getById(audioId: audioId) {
                return mapper.toDomain(model: model)
            }
            return nil
        }
        catch {
            return nil
        }
    }
    
    func delete(favorite: Favorite) async {
        do {
            try await datasource.delete(favorite: favorite)
        }
        catch {
            // Handle error
        }
    }
}
