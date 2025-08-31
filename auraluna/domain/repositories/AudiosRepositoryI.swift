import Foundation

protocol AudiosRepositoryI {
    
    func getById(_ id: Int) async -> Audio?
    
    func getAll() async -> [Audio]
    
    func getByCategories(_ categories: [AudioCategory]) async -> [Audio]
    
    func getByType(_ type: AudioType) async -> [Audio]
    
}
