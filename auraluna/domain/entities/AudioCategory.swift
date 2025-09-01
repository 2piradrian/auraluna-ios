import Foundation

enum AudioCategory: String, CaseIterable, Identifiable {
    case distress
    case anxiety
    case stress
    case happiness
    case anger
    
    var id: String {
        switch self {
        case .distress: return "DISTRESS"
        case .anxiety: return "ANXIETY"
        case .stress: return "STRESS"
        case .happiness: return "HAPPINESS"
        case .anger: return "ANGER"
        }
    }
    
    var localizedName: String {
        switch self {
        case .distress: return NSLocalizedString("distress", comment: "")
        case .anxiety: return NSLocalizedString("anxiety", comment: "")
        case .stress: return NSLocalizedString("stress", comment: "")
        case .happiness: return NSLocalizedString("happiness", comment: "")
        case .anger: return NSLocalizedString("anger", comment: "")
        }
    }
    
    static func toList() -> [AudioCategory] {
        return Array(allCases)
    }
}
