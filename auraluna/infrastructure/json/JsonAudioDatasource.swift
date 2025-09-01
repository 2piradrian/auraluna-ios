import Foundation

class JsonAudioDatasource {
    
    private func getAudioJson() -> String? {
        guard let url = Bundle.main.url(forResource: "audio", withExtension: "json") else {
            return nil
        }
        
        do {
            return try String(contentsOf: url, encoding: .utf8)
        }
        catch {
            return nil
        }
    }
    
    func getAll() -> [AudioModel] {
        guard let jsonString = getAudioJson(),
              let jsonData = jsonString.data(using: .utf8) else {
            return []
        }
        
        let decoder = JSONDecoder()
        do {
            return try decoder.decode([AudioModel].self, from: jsonData)
        }
        catch {
            return []
        }
    }
    
    func getById(id: Int) -> AudioModel? {
        return getAll().first { $0.id == id }
    }
    
    func getByCategories(categories: [String]) -> [AudioModel] {
        return getAll().filter { audioModel in
            audioModel.categories.contains { categories.contains($0) }
        }
    }
    
    func getByType(type: String) -> [AudioModel] {
        return getAll().filter { $0.type == type }
    }
    
}
