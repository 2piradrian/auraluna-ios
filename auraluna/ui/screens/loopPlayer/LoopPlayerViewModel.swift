import Foundation
import Combine
import AVFoundation

@MainActor
class LoopPlayerViewModel: NSObject, ObservableObject {
    private let audioRepository: AudioRepository
    private let favoriteRepository: FavoriteRepository
    private let audioId: Int
    private var player: AVQueuePlayer?

    @Published var audio: Audio?
    @Published var isFavorite: Bool = false
    @Published var isPlaying: Bool = false
    @Published var isReady: Bool = false
    @Published var durations: [Int] = []
    @Published var selectedDuration: Int = 0 {
        didSet {
            Task { await setupPlayer() }
        }
    }

    init(audioRepository: AudioRepository, favoriteRepository: FavoriteRepository, audioId: Int) {
        self.audioRepository = audioRepository
        self.favoriteRepository = favoriteRepository
        self.audioId = audioId
        super.init()
    }

    func getAudioDetails() {
        Task {
            self.audio = await audioRepository.getById(id: audioId)
            if let audio = self.audio {
                if let favorite = await favoriteRepository.getById(audioId: audio.id) {
                    self.isFavorite = true
                }
                self.durations = audio.times
                if let first = audio.times.first {
                    self.selectedDuration = first
                }
                await setupPlayer()
            }
        }
    }

    private func setupPlayer() async {
        player?.removeObserver(self, forKeyPath: "rate")
        player?.removeObserver(self, forKeyPath: "status")
        player?.pause()
        player = nil

        guard let audio = audio, let url = Bundle.main.url(forResource: audio.audioResource, withExtension: "mp3") else { return }
        
        let playerItems = (0..<selectedDuration).map { _ in AVPlayerItem(url: url) }
        player = AVQueuePlayer(items: playerItems)
        
        player?.addObserver(self, forKeyPath: "rate", options: [.new, .initial], context: nil)
        player?.addObserver(self, forKeyPath: "status", options: [.new, .initial], context: nil)
    }

    func playPause() {
        guard isReady else { return }
        if isPlaying {
            player?.pause()
        } else {
            player?.play()
        }
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
        if keyPath == "rate" {
            if let rate = change?[.newKey] as? Float {
                isPlaying = rate != 0
            }
        } else if keyPath == "status" {
            if let statusValue = change?[.newKey] as? Int, let status = AVPlayer.Status(rawValue: statusValue) {
                if status == .readyToPlay {
                    isReady = true
                }
            }
        }
    }

    deinit {
        player?.removeObserver(self, forKeyPath: "rate")
        player?.removeObserver(self, forKeyPath: "status")
        player?.pause()
        player = nil
    }
}
