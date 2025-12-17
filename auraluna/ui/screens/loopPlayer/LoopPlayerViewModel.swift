import Foundation
import Combine
import AVFoundation

@MainActor
class LoopPlayerViewModel: NSObject, ObservableObject {
    private let audioRepository: AudioRepository
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

    init(audioRepository: AudioRepository, audioId: Int) {
        self.audioRepository = audioRepository
        self.audioId = audioId
        super.init()
    }

    func getAudioDetails() {
        Task {
            self.audio = await audioRepository.getById(id: audioId)
            if let audio = self.audio {
                self.durations = audio.times
                if let first = audio.times.first {
                    self.selectedDuration = first
                }
                await setupPlayer()
            }
        }
    }

    private func setupPlayer() async {
        // Clean up old player instance before creating a new one
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
        isFavorite.toggle()
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