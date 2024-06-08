//
//  CurrentSongViewModel.swift
//  Soundly
//
//  Created by Lakshay Gupta on 08/06/24.
//

import Foundation


import Combine
import AVKit
import Combine


import SwiftUI
// GIVES DESCRIPTION OF CURRENT SONG

class CurrentSongViewModel: ObservableObject {
    static let shared: CurrentSongViewModel = CurrentSongViewModel()

    @Published var currentSong: SongData?
    @Published var isPlaying = false
    @Published var currentTime: Double = 0
    @Published var isDragging = false
    @Published var player: AVPlayer?


    private init() {}
}

