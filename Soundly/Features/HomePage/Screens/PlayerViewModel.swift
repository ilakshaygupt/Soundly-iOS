//
//  PlayerViewModel.swift
//  Soundly
//
//  Created by Lakshay Gupta on 15/11/24.
//
import Foundation
import AVKit
import Combine

class PlayerViewModel: ObservableObject {
    static let shared = PlayerViewModel()

    @Published var currentSong: SongData? = nil
    @Published var currentTime: Double = 0
    @Published var isPlaying: Bool = false
    @Published var isDragging: Bool = false

    private var timeObserver: Any?
    private init() {
        setupPlayerTimeObserver()
    }

    let player = AVPlayer()


    func loadSong(_ song: SongData) {
        guard currentSong?.id != song.id else { return }

        player.pause()
        isPlaying = false

        currentSong = song
        if let url = URL(string: song.song_url) {
            let playerItem = AVPlayerItem(url: url)
            player.replaceCurrentItem(with: playerItem)
            player.play()
            isPlaying = true
        }
    }

    func togglePlayPause() {
        if isPlaying {
            player.pause()
        } else {
            player.play()
        }
        isPlaying.toggle()
    }


    func seek(to time: Double) {
        let cmTime = CMTime(seconds: time, preferredTimescale: 1)
        player.seek(to: cmTime)
    }

    private func setupPlayerTimeObserver() {
        timeObserver = player.addPeriodicTimeObserver(
            forInterval: CMTime(seconds: 0.5, preferredTimescale: 1),
            queue: .main
        ) { [weak self] time in
            guard let self = self, !self.isDragging else { return }
            self.currentTime = time.seconds
        }
    }

    deinit {
        if let observer = timeObserver {
            player.removeTimeObserver(observer)
        }
    }
}
