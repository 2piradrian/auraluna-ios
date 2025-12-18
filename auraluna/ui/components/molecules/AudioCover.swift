import SwiftUI

struct AudioCover: View {
    var audio: Audio
    var action: () -> Void

    var body: some View {
        VStack(alignment: .leading) {
            Image(audio.coverResource)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 140, height: 140)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .onTapGesture(perform: action)

            Text(audio.name)
                .font(.body)
            Text(audio.author)
                .font(.caption)
        }
        .padding(.trailing, 16)
    }
}
