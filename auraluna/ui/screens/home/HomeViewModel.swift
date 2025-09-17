import Foundation
import Combine

@MainActor
class HomeViewModel: ObservableObject {
    private let favoritesRepository: FavoriteRepository
    private let audiosRepository: AudioRepository
    
    @Published var audios: [Audio] = []
    @Published var selectedCategories: [AudioCategory] = []
    
    init(favoritesRepository: FavoriteRepository, audiosRepository: AudioRepository) {
        self.favoritesRepository = favoritesRepository
        self.audiosRepository = audiosRepository
    }
    
    func getAudios() {
        Task {
            if selectedCategories.isEmpty {
                let audiosResult = try await audiosRepository.getAll()
                self.audios = audiosResult
            }
            else {
                let audiosResult = try await audiosRepository.getByCategories(categories: selectedCategories)
                self.audios = audiosResult
            }
        }
    }
    
    func toggleSelectedCategory(_ category: AudioCategory) {
        if selectedCategories.contains(category) {
            selectedCategories.removeAll { $0 == category }
        }
        else {
            selectedCategories.append(category)
        }
    }
}
