import Foundation

class AudioRepository: AudioRepositoryI {

    private let datasource: AudioDataSourceI
    private let mapper: AudioMapper

    init(datasource: AudioDataSourceI, mapper: AudioMapper) {
        self.datasource = datasource
        self.mapper = mapper
    }

    func getById(id: Int) async -> Audio? {
        do {
            let model = try await datasource.getById(id: id)
            return mapper.toDomain(model: model)
        }
        catch {
            return nil
        }
    }

    func getAll() async -> [Audio] {
        do {
            let models = try await datasource.getAll()
            return models.map { mapper.toDomain(model: $0) }
        }
        catch {
            return []
        }
    }

    func getByCategories(categories: [AudioCategory]) async -> [Audio] {
        do {
            let categoryStrings = categories.map { $0.rawValue }
            let models = try await datasource.getByCategories(categories: categoryStrings)
            return models.map { mapper.toDomain(model: $0) }
        }
        catch {
            return []
        }
    }

    func getByType(type: AudioType) async -> [Audio] {
        do {
            let models = try await datasource.getByType(type: type.rawValue)
            return models.map { mapper.toDomain(model: $0) }
        }
        catch {
            return []
        }
    }
    
}
