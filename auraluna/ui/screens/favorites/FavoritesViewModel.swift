import Foundation
import Combine

@MainActor
class FavoritesViewModel: ObservableObject {
    private let favoriteRepository: FavoriteRepository
    private let audioRepository: AudioRepository
    
    @Published var favorites: [Favorite] = []
    
    init(favoriteRepository: FavoriteRepository, audioRepository: AudioRepository) {
        self.favoriteRepository = favoriteRepository
        self.audioRepository = audioRepository
    }
    
    func getFavorites() {
        Task {
            self.favorites = await favoriteRepository.getAll()
        }
    }
    
    func toggleFavorite(favorite: Favorite) {
        Task {
            if let fav = await favoriteRepository.getById(audioId: favorite.audioId) {
                await favoriteRepository.delete(favorite: fav)
            }
            getFavorites()
        }
    }

    func getAudio(audioId: Int) async -> Audio? {
        return await audioRepository.getById(id: audioId)
    }
}