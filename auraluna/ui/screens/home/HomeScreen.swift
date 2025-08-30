import SwiftUI

struct HomeScreen: View {
    @Binding var navController: [AppScreens]
    let screenUtils: ScreenUtils
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Home Screen")
                .font(.system(size: screenUtils.resolveSize(
                    mobile: 20,
                    tablet: 26
                )))
                .fontWeight(.bold)
            
            Button("Ir a Favoritos") {
                navController.append(.favoritesScreen)
            }
            
            Button("Ir a Community") {
                navController.append(.communityScreen)
            }
            
            Button("Abrir Loop Player") {
                navController.append(.loopPlayerScreen(audioId: 42))
                /**
                 Ejemplo
                 Button("Play Audio") {
                     if let routeBuilder = RouteUtils.audioRoutes[audio.type] {
                         let screen = routeBuilder(audio.id)
                         path.append(screen) // path es NavigationStack path
                     }
                 }
                 **/
            }
        }
        .padding()
    }
}
