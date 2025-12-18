import SwiftUI

struct AudioPlayerImage: View {
    var imageName: String

    var body: some View {
        ZStack {
            Image(imageName)
                .resizable()
                .scaledToFill()
        }
        .aspectRatio(1, contentMode: .fit)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .padding(.vertical, 16)
        .frame(maxWidth: 350)
    }
}
