import SwiftUI

struct PlayerSlider: View {
    @Binding var position: Double
    var duration: Double
    var seekAction: (Double) -> Void

    var body: some View {
        VStack {
            HStack {
                Text(formatTime(position))
                    .font(.caption)
                Spacer()
                Text(formatTime(duration))
                    .font(.caption)
            }
            .padding(.horizontal, 4)
            .padding(.vertical, 8)

            Slider(value: $position, in: 0...duration) { editing in
                if !editing {
                    seekAction(position)
                }
            }
            .padding(.bottom, 16)
        }
        .frame(height: 48) // Matches the Android component's height
    }

    private func formatTime(_ time: Double) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
