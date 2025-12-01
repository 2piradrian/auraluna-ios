import SwiftUI

struct AppNavigationBar: View {
    @Binding var navController: [AppScreens]
    
    var body: some View {
        HStack {
            // Home Button
            Button(action: {
                // Navigate to home screen
                navController = [.homeScreen]
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
                // Navigate to favorites screen
                navController = [.favoritesScreen]
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
                // Navigate to community screen
                navController = [.communityScreen]
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
