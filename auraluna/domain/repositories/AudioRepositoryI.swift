import Foundation

protocol AudioRepositoryI {
    
    func getById(id: Int) async -> Audio?
    
    func getAll() async -> [Audio]
    
    func getByCategories(categories: [AudioCategory]) async -> [Audio]
    
    func getByType(type: AudioType) async -> [Audio]
    
}
