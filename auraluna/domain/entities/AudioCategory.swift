import Foundation

enum AudioCategory: String, CaseIterable, Identifiable, Codable {
    case distress = "DISTRESS"
    case anxiety = "ANXIETY"
    case stress = "STRESS"
    case happiness = "HAPPINESS"
    case anger = "ANGER"
    
    var id: String {
        return self.rawValue
    }
    
    var localizedName: String {
        return NSLocalizedString(self.rawValue.lowercased(), comment: "")
    }
    
    static func toList() -> [AudioCategory] {
        return Array(allCases)
    }
}
