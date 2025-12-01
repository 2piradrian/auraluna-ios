import SwiftUI

struct AudioCoverListView: View {
    let list: [Audio]
    let title: String
    let onAudioClick: (Audio) -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.headline)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 15) {
                    ForEach(list) { audio in
                        Button(action: { onAudioClick(audio) }) {
                            VStack {
                                // Placeholder for the cover image
                                Image(audio.coverResource)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 140, height: 140)
                                    .clipped()
                                    .cornerRadius(8)
                                    .shadow(radius: 5)
                                
                                Text(audio.name)
                                    .font(.caption)
                                    .lineLimit(1)
                                    .frame(width: 140)
                                
                                Text(audio.author)
                                    .font(.caption2)
                                    .lineLimit(1)
                                    .frame(width: 140)
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}
