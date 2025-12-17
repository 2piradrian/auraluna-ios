import SwiftUI

struct FavoritesScreen: View {
    @Binding var navController: [AppScreens]
    @ObservedObject var viewModel: FavoritesViewModel
    let screenUtils: ScreenUtils
    
    var body: some View {
        VStack(spacing: 0) {
            TitleLarge(text: "Favoritos")
                .padding(.horizontal)

            FavoritesList(
                favorites: viewModel.favorites,
                onFavoriteClick: { favorite in
                    Task {
                        if let audio = await viewModel.getAudio(audioId: favorite.audioId) {
                            switch audio.type {
                            case .lineal:
                                navController.append(.linealPlayerScreen(audioId: audio.id))
                            case .loop:
                                navController.append(.loopPlayerScreen(audioId: audio.id))
                            }
                        }
                    }
                },
                toggleFavorite: { favorite in
                    viewModel.toggleFavorite(favorite: favorite)
                }
            )
            .padding(.horizontal)
            
            Spacer()
            
            AppNavigationBar(navController: $navController)
        }
        .onAppear {
            viewModel.getFavorites()
        }
    }
}