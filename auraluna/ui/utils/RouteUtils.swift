import Foundation

struct RouteUtils {
    static let audioRoutes: [AudioType: (Int) -> AppScreens] = [
        .loop: { audioId in .loopPlayerScreen(audioId: audioId) },
        .lineal: { audioId in .linealPlayerScreen(audioId: audioId) }
    ]
}
