import Foundation
import Combine
import AVFoundation

@MainActor
class LinealPlayerViewModel: NSObject, ObservableObject {
    private let audioRepository: AudioRepository
    private let favoriteRepository: FavoriteRepository
    private let audioId: Int
    private var player: AVPlayer?
    private var timeObserver: Any?

    @Published var audio: Audio?
    @Published var isFavorite: Bool = false
    @Published var isPlaying: Bool = false
    @Published var position: Double = 0.0
    @Published var duration: Double = 0.0
    @Published var isReady: Bool = false

    init(audioRepository: AudioRepository, favoriteRepository: FavoriteRepository, audioId: Int) {
        self.audioRepository = audioRepository
        self.favoriteRepository = favoriteRepository
        self.audioId = audioId
        super.init()
    }

    func getAudioDetails() {
        Task {
            self.audio = await audioRepository.getById(id: audioId)
            if let favorite = await favoriteRepository.getById(audioId: audioId) {
                self.isFavorite = true
            }
            await setupPlayer()
        }
    }

    private func setupPlayer() async {
        guard let audio = audio, let url = Bundle.main.url(forResource: audio.audioResource, withExtension: "mp3") else { return }
        player = AVPlayer(url: url)
        
        player?.addObserver(self, forKeyPath: "status", options: [.new, .initial], context: nil)
        
        timeObserver = player?.addPeriodicTimeObserver(forInterval: CMTime(seconds: 0.5, preferredTimescale: 600), queue: .main) { [weak self] time in
            guard let self = self else { return }
            self.position = time.seconds
            self.isPlaying = self.player?.rate != 0
        }
    }

    func playPause() {
        guard isReady else { return }
        if isPlaying {
            player?.pause()
        } else {
            player?.play()
        }
    }
    
    func seek(to time: Double) {
        player?.seek(to: CMTime(seconds: time, preferredTimescale: 600))
    }

    func toggleFavorite() {
        Task {
            if isFavorite {
                if let audio = self.audio, let favToDelete = await favoriteRepository.getById(audioId: audio.id) {
                    await favoriteRepository.delete(favorite: favToDelete)
                    isFavorite = false
                }
            } else {
                if let audio = self.audio {
                    let newFavorite = Favorite(id: audio.id, audioId: audio.id, name: audio.name, author: audio.author)
                    await favoriteRepository.insert(favorite: newFavorite)
                    isFavorite = true
                }
            }
        }
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "status", let player = object as? AVPlayer {
            if player.status == .readyToPlay {
                let durationSeconds = player.currentItem?.duration.seconds ?? 0.0
                self.duration = durationSeconds.isNaN ? 0.0 : durationSeconds
                self.isReady = true
            }
        }
    }

    deinit {
        if let timeObserver = timeObserver {
            player?.removeTimeObserver(timeObserver)
        }
        player?.removeObserver(self, forKeyPath: "status")
        player?.pause()
        player = nil
    }
}
