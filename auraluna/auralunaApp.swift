import SwiftUI

@main
struct AuralunaApp: App {
    
    private let appContainer = AppContainer()
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some Scene {
        WindowGroup {
            
            let screenType: ScreenType = {
                switch horizontalSizeClass {
                    case .compact:
                        return .mobile
                    case .regular:
                        return .tablet
                    default:
                        return .mobile
                }
            }()
            
            AppScreenManager(
                appContainer: appContainer,
                screenType: screenType
            )
            
        }
    }
}
