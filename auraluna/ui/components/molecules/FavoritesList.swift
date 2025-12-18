import SwiftUI

struct FavoritesList: View {
    var favorites: [Favorite]
    var onFavoriteClick: (Favorite) -> Void
    var toggleFavorite: (Favorite) -> Void

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(favorites) { favorite in
                    FavoriteItem(
                        name: favorite.name,
                        author: favorite.author,
                        action: { onFavoriteClick(favorite) },
                        toggleFavorite: { toggleFavorite(favorite) }
                    )
                }
            }
        }
    }
}
