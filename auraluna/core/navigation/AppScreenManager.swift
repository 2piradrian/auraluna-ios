import SwiftUI

struct AppScreenManager: View {
    
    let appContainer: AppContainer
    let screenType: ScreenType
    
    @State private var path: [AppScreens] = []
    private let screenUtils: ScreenUtils
    
    init(appContainer: AppContainer, screenType: ScreenType) {
        self.appContainer = appContainer
        self.screenType = screenType
        self.screenUtils = ScreenUtils(screenType: screenType)
    }
    
    var body: some View {
        NavigationStack(path: $path) {
            HomeScreen(
                navController: $path,
                viewModel: HomeViewModel(
                    favoritesRepository: appContainer.favoriteRepository,
                    audiosRepository: appContainer.audioRepository,
                ),
                screenUtils: screenUtils,
            )
            .navigationDestination(for: AppScreens.self) { screen in
                switch screen {
                    case .homeScreen:
                    HomeScreen(
                        navController: $path,
                        viewModel: HomeViewModel(
                            favoritesRepository: appContainer.favoriteRepository,
                            audiosRepository: appContainer.audioRepository,
                        ),
                        screenUtils: screenUtils,
                    )
                    case .favoritesScreen:
                    FavoritesScreen(
                        navController: $path,
                        screenUtils: screenUtils
                    )
                    case .communityScreen:
                    CommunityScreen(
                        navController: $path,
                        screenUtils: screenUtils
                    )
                    case let .loopPlayerScreen(audioId):
                        LoopPlayerScreen(
                            navController: $path,
                            viewModel: LoopPlayerViewModel(
                                audioRepository: appContainer.audioRepository,
                                audioId: audioId
                            )
                        )
                    case let .linealPlayerScreen(audioId):
                        LinealPlayerScreen(
                            navController: $path,
                            viewModel: LinealPlayerViewModel(
                                audioRepository: appContainer.audioRepository,
                                audioId: audioId
                            )
                        )
                }
            }
        }
    }
}
