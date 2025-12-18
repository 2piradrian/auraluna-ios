import SwiftUI

struct TitleLarge: View {
    var text: String

    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding(.vertical, 16)
    }
}
