import SwiftUI

struct FavoriteItem: View {
    var name: String
    var author: String
    var action: () -> Void
    var toggleFavorite: () -> Void

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(name)
                    .font(.headline)
                Text(author)
                    .font(.subheadline)
            }
            .contentShape(Rectangle())
            .onTapGesture(perform: action)

            Spacer()

            Button(action: toggleFavorite) {
                Image(systemName: "heart.fill")
                    .font(.title2)
                    .foregroundColor(.accentColor) // Or some other color
            }
            .buttonStyle(.plain)
        }
        .padding(.vertical, 16)
    }
}
