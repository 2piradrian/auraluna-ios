import Foundation

protocol AudioRepositoryI {
    
    func getById(_ id: Int) async -> Audio?
    
    func getAll() async -> [Audio]
    
    func getByCategories(_ categories: [AudioCategory]) async -> [Audio]
    
    func getByType(_ type: AudioType) async -> [Audio]
    
}
