import Foundation

struct AudioMapper {

    func toDomain(model: AudioModel) -> Audio {
        return Audio(
            id: model.id,
            name: model.name,
            author: model.author,
            coverResource: model.coverResource,
            audioResource: model.audioResource,
            type: AudioType(rawValue: model.type) ?? .loop,
            format: AudioFormat(rawValue: model.format) ?? .sound,
            categories: model.categories.compactMap { AudioCategory(rawValue: $0.lowercased()) },
            times: model.times,
            duration: model.duration
        )
    }

    func toModel(domain: Audio) -> AudioModel {
        return AudioModel(
            id: domain.id,
            name: domain.name,
            author: domain.author,
            coverResource: domain.coverResource,
            audioResource: domain.audioResource,
            type: domain.type.rawValue,
            format: domain.format.rawValue,
            categories: domain.categories.map { $0.rawValue },
            times: domain.times,
            duration: domain.duration
        )
    }
    
}
