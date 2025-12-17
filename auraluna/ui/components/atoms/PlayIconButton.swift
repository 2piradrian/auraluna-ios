import SwiftUI

struct PlayIconButton: View {
    var isPlaying: Bool
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                .font(.title)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
        }
    }
}
