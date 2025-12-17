import SwiftUI

struct AppNavigationBar: View {
    @Binding var navController: [AppScreens]
    
    var body: some View {
        HStack {
            // Home Button
            Button(action: {
                if !navController.isEmpty {
                    navController = []
                }
            }) {
                VStack {
                    Image(systemName: "house.fill")
                        .font(.title2)
                    Text("Inicio")
                        .font(.caption)
                }
            }
            .frame(maxWidth: .infinity)
            
            // Favorites Button
            Button(action: {
                if navController != [.favoritesScreen] {
                    navController = [.favoritesScreen]
                }
            }) {
                VStack {
                    Image(systemName: "heart.fill")
                        .font(.title2)
                    Text("Favoritos")
                        .font(.caption)
                }
            }
            .frame(maxWidth: .infinity)
            
            // Community Button
            Button(action: {
                if navController != [.communityScreen] {
                    navController = [.communityScreen]
                }
            }) {
                VStack {
                    Image(systemName: "person.3.fill")
                        .font(.title2)
                    Text("Comunidad")
                        .font(.caption)
                }
            }
            .frame(maxWidth: .infinity)
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background(Color(.systemBackground))
        .shadow(radius: 2)
    }
}
