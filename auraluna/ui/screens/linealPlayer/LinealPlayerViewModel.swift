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
    private var isSeeking: Bool = false

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
        
        let playerItem = AVPlayerItem(url: url)
        player = AVPlayer(playerItem: playerItem)
        
        player?.currentItem?.addObserver(self, forKeyPath: "status", options: [.new, .initial], context: nil)
        player?.addObserver(self, forKeyPath: "rate", options: [.new, .initial], context: nil)

        timeObserver = player?.addPeriodicTimeObserver(forInterval: CMTime(seconds: 0.5, preferredTimescale: 600), queue: .main) { [weak self] time in
            guard let self = self, !self.isSeeking else { return }
            self.position = time.seconds
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

    func setIsSeeking(to isSeeking: Bool) {
        self.isSeeking = isSeeking
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "status", let item = object as? AVPlayerItem {
            if item.status == .readyToPlay {
                let durationSeconds = item.duration.seconds ?? 0.0
                self.duration = durationSeconds.isNaN ? 0.0 : durationSeconds
                self.isReady = true
            }
        } else if keyPath == "rate", let player = object as? AVPlayer {
             if let rate = change?[.newKey] as? Float {
                self.isPlaying = rate != 0
            }
        }
    }

    deinit {
        if let timeObserver = timeObserver {
            player?.removeTimeObserver(timeObserver)
        }
        player?.currentItem?.removeObserver(self, forKeyPath: "status")
        player?.removeObserver(self, forKeyPath: "rate")
        player?.pause()
        player = nil
    }
}
