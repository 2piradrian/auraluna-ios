import SwiftUI

struct Typography {
    let displayLarge: Font
    let displayMedium: Font
    let displaySmall: Font
    
    let headlineLarge: Font
    let headlineMedium: Font
    let headlineSmall: Font
    
    let titleLarge: Font
    let titleMedium: Font
    let titleSmall: Font
    
    let bodyLarge: Font
    let bodyMedium: Font
    let bodySmall: Font
    
    let labelLarge: Font
    let labelMedium: Font
    let labelSmall: Font
}

extension Typography {
    static let `default` = Typography(
        displayLarge: .system(size: 57, weight: .bold),
        displayMedium: .system(size: 45, weight: .bold),
        displaySmall: .system(size: 36, weight: .bold),
        
        headlineLarge: .system(size: 32, weight: .semibold),
        headlineMedium: .system(size: 28, weight: .semibold),
        headlineSmall: .system(size: 24, weight: .semibold),
        
        titleLarge: .system(size: 24, weight: .bold),
        titleMedium: .system(size: 20, weight: .semibold),
        titleSmall: .system(size: 14, weight: .medium),
        
        bodyLarge: .system(size: 16, weight: .regular),
        bodyMedium: .system(size: 14, weight: .regular),
        bodySmall: .system(size: 12, weight: .regular),
        
        labelLarge: .system(size: 14, weight: .medium),
        labelMedium: .system(size: 12, weight: .medium),
        labelSmall: .system(size: 11, weight: .medium)
    )
}
