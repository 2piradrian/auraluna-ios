import Foundation

struct AudioModel: Decodable {
    let id: Int
    let name: String
    let author: String
    let coverResource: String
    let audioResource: String
    let type: String
    let format: String
    let categories: [String]
    let times: [Int]
    let duration: String
}
