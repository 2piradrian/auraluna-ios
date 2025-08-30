import Foundation

enum AppScreens: Hashable {
    
    case homeScreen
    case favoritesScreen
    case communityScreen
    case loopPlayerScreen(audioId: Int)
    case linealPlayerScreen(audioId: Int)
    
    var route: String {
        switch self {
            case .homeScreen: return "home_screen"
            case .favoritesScreen: return "favorites_screen"
            case .communityScreen: return "community_screen"
            case .loopPlayerScreen: return "loop_player_screen"
            case .linealPlayerScreen: return "lineal_player_screen"
        }
    }
    
}
