import SwiftUI

struct LinealPlayerScreen: View {
    @Binding var navController: [AppScreens]
    @StateObject var viewModel: LinealPlayerViewModel

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

                    PlayerSlider(
                        position: $viewModel.position,
                        duration: viewModel.duration,
                        seekAction: { newPosition in
                            viewModel.seek(to: newPosition)
                        },
                        onEditingChanged: { isEditing in
                            viewModel.setIsSeeking(to: isEditing)
                        }
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
