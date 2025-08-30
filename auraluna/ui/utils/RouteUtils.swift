import Foundation

struct RouteUtils {
    static let audioRoutes: [AudioType: AppScreens] = [
        .loop: .loopPlayerScreen(audioId: 0),           // audioId dummy
        .lineal: .linealPlayerScreen(audioId: 0)        // audioId dummy
    ]
}
