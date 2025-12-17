import Foundation
import Combine

@MainActor
class FavoritesViewModel: ObservableObject {
    private let favoriteRepository: FavoriteRepository
    
    @Published var favorites: [Favorite] = []
    
    init(favoriteRepository: FavoriteRepository) {
        self.favoriteRepository = favoriteRepository
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
            // After deleting, refresh the list
            getFavorites()
        }
    }
}
