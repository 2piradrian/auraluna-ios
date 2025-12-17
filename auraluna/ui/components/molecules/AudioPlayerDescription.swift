import SwiftUI

struct AudioPlayerDescription: View {
    var name: String
    var author: String
    var isLiked: Bool
    var toggleFavorite: () -> Void

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(name)
                    .font(.largeTitle)
                Text(author)
                    .font(.body)
            }

            Spacer()

            Button(action: toggleFavorite) {
                Image(systemName: isLiked ? "heart.fill" : "heart")
                    .font(.title)
                    .foregroundColor(isLiked ? .red : .gray)
            }
            .buttonStyle(.plain)
        }
        .padding(.vertical, 16)
    }
}
