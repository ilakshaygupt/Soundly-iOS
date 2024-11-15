//
//  CurrentSongViewModel.swift
//  Soundly
//
//  Created by Lakshay Gupta on 08/06/24.
//
import Foundation
import Combine
import AVKit

class CurrentSongViewModel: ObservableObject {
    static let shared = CurrentSongViewModel()

    @Published var currentSong: SongData?
    @Published var currentTime: Double = 0.0
    @Published var isPlaying: Bool = false
    @Published var isDragging: Bool = false
    @Published var isPlayerReady: Bool = false

    @Published var player: AVPlayer? {
        didSet {
            setupPlayerObserver()
        }
    }
    private func setupPlayerObserver() {
        playerStatusObserver = player?.publisher(for: \.status)
            .map { $0 == .readyToPlay }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] isReady in
                self?.isPlayerReady = isReady
            }
    }
    private var timer: AnyCancellable?
    private var playerStatusObserver: AnyCancellable?

    private init() {}

    func startTimer() {
        stopTimer() // Ensure any existing timer is cancelled
        timer = Timer.publish(every: 0.5, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self = self, let player = self.player else { return }
                if !self.isDragging {
                    self.currentTime = player.currentTime().seconds
                }
            }
    }

    func stopTimer() {
        timer?.cancel()
        timer = nil
    }

    func play() {
        player?.play()
        isPlaying = true
        startTimer()
    }

    func pause() {
        player?.pause()
        isPlaying = false
        stopTimer()
    }

    func seek(to time: Double) {
        player?.seek(to: CMTime(seconds: time, preferredTimescale: 1))
        currentTime = time
    }
}

