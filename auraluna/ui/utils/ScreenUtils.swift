import SwiftUI

enum ScreenType {
    case mobile
    case tablet
}

class ScreenUtils {
    
    private let screenType: ScreenType
    
    init(screenType: ScreenType) {
        self.screenType = screenType
    }
    
    func resolveSize(
        mobile: CGFloat,
        tablet: CGFloat
    ) -> CGFloat {
        switch screenType {
            case .mobile:
                return mobile
            case .tablet:
                return tablet
        }
    }
    
}
