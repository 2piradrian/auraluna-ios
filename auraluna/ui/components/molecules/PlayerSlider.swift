import SwiftUI

struct PlayerSlider: View {
    @Binding var position: Double
    var duration: Double
    var seekAction: (Double) -> Void
    var onEditingChanged: (Bool) -> Void // Added

    var body: some View {
        VStack {
            Slider(value: $position, in: 0...duration) { editing in
                onEditingChanged(editing) // Call the new closure
                if !editing {
                    seekAction(position)
                }
            }
            HStack {
                Text(formatTime(position))
                    .font(.caption)
                Spacer()
                Text(formatTime(duration))
                    .font(.caption)
            }
        }
    }

    private func formatTime(_ time: Double) -> String {
        if time.isNaN || time.isInfinite {
            return "00:00"
        }
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
