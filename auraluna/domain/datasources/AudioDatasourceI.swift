import Foundation

protocol AudioDataSourceI {
    
    func getById(id: Int) async throws -> AudioModel
    
    func getAll() async throws -> [AudioModel]
    
    func getByCategories(categories: [String]) async throws -> [AudioModel]
    
    func getByType(type: String) async throws -> [AudioModel]
    
}
