import SwiftUI

struct HomeScreen: View {
    
    @Binding var navController: [AppScreens]
    @StateObject var viewModel: HomeViewModel
    let screenUtils: ScreenUtils
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 16) {
                Text("Auraluna")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal)

                ScrollView {
                    VStack(spacing: 30) {
                        AudioCoverList(
                            list: viewModel.audios,
                            title: "Tómate tu tiempo",
                            onAudioClick: { audio in
                                switch audio.type {
                                case .loop:
                                    navController.append(.loopPlayerScreen(audioId: audio.id))
                                case .lineal:
                                    navController.append(.linealPlayerScreen(audioId: audio.id))
                                }
                            }
                        )

                        AudioCoverList(
                            list: viewModel.audios,
                            title: "Momentos de paz",
                            onAudioClick: { audio in
                                switch audio.type {
                                case .loop:
                                    navController.append(.loopPlayerScreen(audioId: audio.id))
                                case .lineal:
                                    navController.append(.linealPlayerScreen(audioId: audio.id))
                                }
                            }
                        )

                        AudioCoverList(
                            list: viewModel.audios,
                            title: "Crea tu ritual",
                            onAudioClick: { audio in
                                switch audio.type {
                                case .loop:
                                    navController.append(.loopPlayerScreen(audioId: audio.id))
                                case .lineal:
                                    navController.append(.linealPlayerScreen(audioId: audio.id))
                                }
                            }
                        )
                    }
                }
            }
            .onAppear {
                viewModel.getAudios()
            }

            Spacer()

            AppNavigationBar(navController: $navController)
        }
    }
}
