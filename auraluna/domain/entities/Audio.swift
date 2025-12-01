import Foundation

struct Audio: Codable, Identifiable {
    let id: Int // This is the id of the audio in the database
    let name: String
    let author: String
    let audioResource: String // This is the id of the audio in the database
    let coverResource: String
    let type: AudioType
    let format: AudioFormat
    let categories: [AudioCategory]
    let duration: String
    let times: [Int]

    enum CodingKeys: String, CodingKey {
        case id, name, author, type, format, categories, duration, times
        case audioResource = "audioResource"
        case coverResource = "coverResource"
    }
}
