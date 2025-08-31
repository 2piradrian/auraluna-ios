import SwiftUI

struct AppColorScheme {
    let primary: Color
    let onPrimary: Color
    let primaryContainer: Color
    let onPrimaryContainer: Color
    
    let secondary: Color
    let onSecondary: Color
    let secondaryContainer: Color
    let onSecondaryContainer: Color
    
    let tertiary: Color
    let onTertiary: Color
    let tertiaryContainer: Color
    let onTertiaryContainer: Color
    
    let error: Color
    let onError: Color
    let errorContainer: Color
    let onErrorContainer: Color
    
    let background: Color
    let onBackground: Color
    let surface: Color
    let onSurface: Color
    let surfaceVariant: Color
    let onSurfaceVariant: Color
    
    let outline: Color
    let outlineVariant: Color
    let scrim: Color
    let inverseSurface: Color
    let inverseOnSurface: Color
    let inversePrimary: Color
    
    let surfaceDim: Color
    let surfaceBright: Color
    let surfaceContainerLowest: Color
    let surfaceContainerLow: Color
    let surfaceContainer: Color
    let surfaceContainerHigh: Color
    let surfaceContainerHighest: Color
}

extension AppColorScheme {
    static let current = AppColorScheme(
        primary: Color("colorPrimary"),
        onPrimary: Color("colorOnPrimary"),
        primaryContainer: Color("colorPrimaryContainer"),
        onPrimaryContainer: Color("colorOnPrimaryContainer"),
        
        secondary: Color("colorSecondary"),
        onSecondary: Color("colorOnSecondary"),
        secondaryContainer: Color("colorSecondaryContainer"),
        onSecondaryContainer: Color("colorOnSecondaryContainer"),
        
        tertiary: Color("colorTertiary"),
        onTertiary: Color("colorOnTertiary"),
        tertiaryContainer: Color("colorTertiaryContainer"),
        onTertiaryContainer: Color("colorOnTertiaryContainer"),
        
        error: Color("colorError"),
        onError: Color("colorOnError"),
        errorContainer: Color("colorErrorContainer"),
        onErrorContainer: Color("colorOnErrorContainer"),
        
        background: Color("colorBackground"),
        onBackground: Color("colorOnBackground"),
        surface: Color("colorSurface"),
        onSurface: Color("colorOnSurface"),
        surfaceVariant: Color("colorSurfaceVariant"),
        onSurfaceVariant: Color("colorOnSurfaceVariant"),
        
        outline: Color("colorOutline"),
        outlineVariant: Color("colorOutlineVariant"),
        scrim: Color("colorScrim"),
        inverseSurface: Color("colorInverseSurface"),
        inverseOnSurface: Color("colorInverseOnSurface"),
        inversePrimary: Color("colorInversePrimary"),
        
        surfaceDim: Color("colorSurfaceDim"),
        surfaceBright: Color("colorSurfaceBright"),
        surfaceContainerLowest: Color("colorSurfaceContainerLowest"),
        surfaceContainerLow: Color("colorSurfaceContainerLow"),
        surfaceContainer: Color("colorSurfaceContainer"),
        surfaceContainerHigh: Color("colorSurfaceContainerHigh"),
        surfaceContainerHighest: Color("colorSurfaceContainerHighest")
    )
}
