import Foundation

class JsonAudioDatasource: AudioDatasourceI {
    
    private func getAudioJson() async throws -> String {
        guard let url = Bundle.main.url(forResource: "audio", withExtension: "json") else {
            throw NSError(domain: "JsonAudioDatasource",
                          code: -1,
                          userInfo: [NSLocalizedDescriptionKey: "Archivo audio.json no encontrado en el bundle"])
        }
        
        return try String(contentsOf: url, encoding: .utf8)
    }
    
    func getAll() async throws -> [AudioModel] {
        let jsonString = try await getAudioJson()
        guard let jsonData = jsonString.data(using: .utf8) else {
            throw NSError(domain: "JsonAudioDatasource",
                          code: -1,
                          userInfo: [NSLocalizedDescriptionKey: "Error al convertir JSON a Data"])
        }
        
        let decoder = JSONDecoder()
        return try decoder.decode([AudioModel].self, from: jsonData)
    }
    
    func getById(id: Int) async throws -> AudioModel {
        guard let model = try await getAll().first(where: { $0.id == id }) else {
            throw NSError(domain: "JsonAudioDatasource",
                          code: -1,
                          userInfo: [NSLocalizedDescriptionKey: "No se encontró AudioModel con id \(id)"])
        }
        return model
    }
    
    func getByCategories(categories: [String]) async throws -> [AudioModel] {
        return try await getAll().filter { audioModel in
            audioModel.categories.contains { categories.contains($0) }
        }
    }
    
    func getByType(type: String) async throws -> [AudioModel] {
        return try await getAll().filter { $0.type == type }
    }
    
}
