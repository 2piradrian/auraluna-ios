import Foundation

class AppContainer {
    
    lazy var audioRepository: AudioRepository = {
        AudioRepository(
            datasource: JsonAudioDatasource(),
            mapper: AudioMapper()
        )
    }()
    
}
