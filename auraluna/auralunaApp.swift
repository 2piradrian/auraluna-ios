import SwiftUI

@main
struct AuralunaApp: App {
    
    private let appContainer = AppContainer()
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.colorScheme) var systemColorScheme
    
    var theme: ThemeEnvironment {
        let colors = (systemColorScheme == .dark) ? AppColorScheme.dark : AppColorScheme.light
        return ThemeEnvironment(colors: colors, typography: Typography.default)
    }
    
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
            .environment(\.theme, theme)
        }
    }
    
}
