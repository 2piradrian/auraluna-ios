import Foundation

class AppContainer {
    
    lazy var audioRepository: AudioRepository = {
        AudioRepository(
            datasource: JsonAudioDatasource(),
            mapper: AudioMapper()
        )
    }()
    
    lazy var favoriteRepository: FavoriteRepository = {
        FavoriteRepository(
            datasource: CoreDataFavoriteDatasource(),
            mapper: FavoriteMapper(
                context: FavoritesDatabase.shared.context
            )
        )
    }()
    
}
