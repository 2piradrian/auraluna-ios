import SwiftUI

struct CategoriesList: View {
    var categories: [AudioCategory]
    @Binding var selectedCategories: Set<AudioCategory>
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(categories) { category in
                    Chip(
                        text: category.localizedName,
                        selected: selectedCategories.contains(category),
                        action: {
                            if selectedCategories.contains(category) {
                                selectedCategories.remove(category)
                            } else {
                                selectedCategories.insert(category)
                            }
                        }
                    )
                }
            }
            .padding(.horizontal)
        }
        .frame(height: 48)
    }
}
