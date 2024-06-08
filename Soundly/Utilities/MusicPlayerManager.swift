//
//  MusicPlayerManafer.swift
//  Soundly
//
//  Created by Lakshay Gupta on 07/06/24.
//
import Foundation
import Combine
import AVKit

class MusicPlayerManager: ObservableObject {
    static let shared = MusicPlayerManager()

    @Published var song: SongData?
    @Published var isPlaying = false
    @Published var player: AVPlayer?

    private init() {}

    func setSong(_ song: SongData) {
        self.song = song
        play()
    }

    func setPlayer(_ player: AVPlayer) {
        self.player = player
        play()
    }

    func play() {
        isPlaying = true
        player?.play()
    }

    func pause() {
        isPlaying = false
        player?.pause()
    }

    func togglePlayPause() {
        if isPlaying {
            pause()
        } else {
            play()
        }
    }
}
