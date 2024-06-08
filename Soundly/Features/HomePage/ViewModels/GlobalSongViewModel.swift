//
//  GlobalSongViewModel.swift
//  Soundly
//
//  Created by Lakshay Gupta on 08/06/24.
//
import Foundation
import AVKit
import Combine

class GlobalSongViewModel: ObservableObject {
    @Published var currentSong: SongData?
    @Published var isPlaying: Bool = false
    @Published var player: AVPlayer?
    @Published var errorMessage: String?

    
    func playSong(songData: SongData) {
        guard let url = URL(string: songData.song_url) else {
            errorMessage = "Invalid song URL"
            return
        }

        let avPlayer = AVPlayer(url: url)
        player = avPlayer
        currentSong = songData
        isPlaying = true
        avPlayer.play()
    }
}
