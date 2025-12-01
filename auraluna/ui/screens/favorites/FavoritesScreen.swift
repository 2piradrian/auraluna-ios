import SwiftUI

struct FavoritesScreen: View {
    @Binding var navController: [AppScreens]
    let screenUtils: ScreenUtils
    
    var body: some View {
        VStack(spacing: 0) {
            Text("Favorites Screen")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            Spacer()
            
            AppNavigationBar(navController: $navController)
        }
    }
}
