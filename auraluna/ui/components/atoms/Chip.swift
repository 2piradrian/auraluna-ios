import SwiftUI

struct Chip: View {
    var text: String
    var selected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(text)
                .font(.body)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(selected ? Color.accentColor : Color(.systemGray5))
                .foregroundColor(selected ? .white : .primary)
                .cornerRadius(20)
        }
        .buttonStyle(.plain)
    }
}
