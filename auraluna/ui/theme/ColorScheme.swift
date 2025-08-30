import SwiftUI

struct ColorScheme {
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

extension ColorScheme {
    static let light = ColorScheme(
        primary: Color(hex: "#8C4E29"),
        onPrimary: Color(hex: "#FFFFFF"),
        primaryContainer: Color(hex: "#FFDBCA"),
        onPrimaryContainer: Color(hex: "#331200"),
        
        secondary: Color(hex: "#765848"),
        onSecondary: Color(hex: "#FFFFFF"),
        secondaryContainer: Color(hex: "#FFDBCA"),
        onSecondaryContainer: Color(hex: "#2B160A"),
        
        tertiary: Color(hex: "#636032"),
        onTertiary: Color(hex: "#FFFFFF"),
        tertiaryContainer: Color(hex: "#EAE5AB"),
        onTertiaryContainer: Color(hex: "#1E1C00"),
        
        error: Color(hex: "#BA1A1A"),
        onError: Color(hex: "#FFFFFF"),
        errorContainer: Color(hex: "#FFDAD6"),
        onErrorContainer: Color(hex: "#410002"),
        
        background: Color(hex: "#FFF8F6"),
        onBackground: Color(hex: "#221A15"),
        surface: Color(hex: "#FFF8F6"),
        onSurface: Color(hex: "#221A15"),
        surfaceVariant: Color(hex: "#F4DED4"),
        onSurfaceVariant: Color(hex: "#52443C"),
        
        outline: Color(hex: "#85746B"),
        outlineVariant: Color(hex: "#D7C2B9"),
        scrim: Color(hex: "#000000"),
        inverseSurface: Color(hex: "#382E29"),
        inverseOnSurface: Color(hex: "#FFEDE5"),
        inversePrimary: Color(hex: "#FFB68E"),
        
        surfaceDim: Color(hex: "#E8D7CF"),
        surfaceBright: Color(hex: "#FFF8F6"),
        surfaceContainerLowest: Color(hex: "#FFFFFF"),
        surfaceContainerLow: Color(hex: "#FFF1EB"),
        surfaceContainer: Color(hex: "#FCEAE3"),
        surfaceContainerHigh: Color(hex: "#F6E5DD"),
        surfaceContainerHighest: Color(hex: "#F0DFD7")
    )
    
    static let dark = ColorScheme(
        primary: Color(hex: "#FFB68E"),
        onPrimary: Color(hex: "#532201"),
        primaryContainer: Color(hex: "#6F3813"),
        onPrimaryContainer: Color(hex: "#FFDBCA"),
        
        secondary: Color(hex: "#E6BEAA"),
        onSecondary: Color(hex: "#432B1D"),
        secondaryContainer: Color(hex: "#5C4132"),
        onSecondaryContainer: Color(hex: "#FFDBCA"),
        
        tertiary: Color(hex: "#CDC991"),
        onTertiary: Color(hex: "#343208"),
        tertiaryContainer: Color(hex: "#4B481D"),
        onTertiaryContainer: Color(hex: "#EAE5AB"),
        
        error: Color(hex: "#FFB4AB"),
        onError: Color(hex: "#690005"),
        errorContainer: Color(hex: "#93000A"),
        onErrorContainer: Color(hex: "#FFDAD6"),
        
        background: Color(hex: "#1A120D"),
        onBackground: Color(hex: "#F0DFD7"),
        surface: Color(hex: "#1A120D"),
        onSurface: Color(hex: "#F0DFD7"),
        surfaceVariant: Color(hex: "#52443C"),
        onSurfaceVariant: Color(hex: "#D7C2B9"),
        
        outline: Color(hex: "#9F8D84"),
        outlineVariant: Color(hex: "#52443C"),
        scrim: Color(hex: "#000000"),
        inverseSurface: Color(hex: "#F0DFD7"),
        inverseOnSurface: Color(hex: "#382E29"),
        inversePrimary: Color(hex: "#8C4E29"),
        
        surfaceDim: Color(hex: "#1A120D"),
        surfaceBright: Color(hex: "#413732"),
        surfaceContainerLowest: Color(hex: "#140D09"),
        surfaceContainerLow: Color(hex: "#221A15"),
        surfaceContainer: Color(hex: "#271E19"),
        surfaceContainerHigh: Color(hex: "#312823"),
        surfaceContainerHighest: Color(hex: "#3D332E")
    )
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let r = Double((int >> 16) & 0xFF) / 255
        let g = Double((int >> 8) & 0xFF) / 255
        let b = Double(int & 0xFF) / 255
        self.init(red: r, green: g, blue: b)
    }
}
