import SwiftUI

struct DurationList: View {
    var durations: [Int]
    @Binding var selectedDuration: Int
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(durations, id: \.self) { duration in
                    Chip(
                        text: "\(duration) min",
                        selected: selectedDuration == duration,
                        action: {
                            selectedDuration = duration
                        }
                    )
                }
            }
        }
    }
}
