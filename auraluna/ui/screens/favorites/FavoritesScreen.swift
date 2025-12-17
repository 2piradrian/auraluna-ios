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
                    // TODO: Implement navigation to player
                },
                toggleFavorite: { favorite in
                    viewModel.toggleFavorite(favorite: favorite)
                }
            )
            
            Spacer()
            
            AppNavigationBar(navController: $navController)
        }
        .onAppear {
            viewModel.getFavorites()
        }
    }
}