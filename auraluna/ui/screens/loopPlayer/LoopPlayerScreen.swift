import SwiftUI

struct LoopPlayerScreen: View {
    @Binding var navController: [AppScreens]
    @StateObject var viewModel: LoopPlayerViewModel

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                if let audio = viewModel.audio {
                    AudioPlayerImage(imageName: audio.coverResource)

                    AudioPlayerDescription(
                        name: audio.name,
                        author: audio.author,
                        isLiked: viewModel.isFavorite,
                        toggleFavorite: {
                            viewModel.toggleFavorite()
                        }
                    )

                    DurationList(
                        durations: viewModel.durations,
                        selectedDuration: $viewModel.selectedDuration
                    )

                    PlayIconButton(
                        isPlaying: viewModel.isPlaying,
                        action: {
                            viewModel.playPause()
                        }
                    )
                } else {
                    Text("Loading...")
                }
            }
            .padding()

        }
        .onAppear {
            viewModel.getAudioDetails()
        }
    }
}
