struct Audio {
    let id: Int                // This is the id of the audio in the database
    let name: String
    let author: String
    let coverResource: Int
    let audioResource: Int     // This is the id of the audio in the audio file
    let type: AudioType
    let format: AudioFormat
    let categories: [AudioCategory]
    let times: [Int]
    let duration: String
}
