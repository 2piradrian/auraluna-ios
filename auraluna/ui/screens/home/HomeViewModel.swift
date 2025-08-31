import Foundation

class HomeViewModel: ObservableObject {
    private let appContainer: AppContainer
    
    init(appContainer: AppContainer) {
        self.appContainer = appContainer
    }
    
}
