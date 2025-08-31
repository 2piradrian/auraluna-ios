struct Favorite {
    let id: Int = 0     // This is the id of the favorite in the favorites database
    let audioId: Int    // This is the id of the audio in the audios database (FK)
    let name: String
    let author: String
}
