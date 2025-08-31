import SwiftUI

struct ThemeEnvironment {
    let colors: AppColorScheme
    let typography: Typography
}

private struct ThemeKey: EnvironmentKey {
    static let defaultValue = ThemeEnvironment(colors: .light, typography: .default)
}

extension EnvironmentValues {
    var theme: ThemeEnvironment {
        get { self[ThemeKey.self] }
        set { self[ThemeKey.self] = newValue }
    }
}
