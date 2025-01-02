//
//  WatchNowPlayingViewModel.swift
//  Soundly
//
//  Created by Lakshay Gupta on 03/01/25.
//

import SwiftUI

class WatchNowPlayingViewModel: ObservableObject {
    @Published var currentSong: WatchSongData?
    private let connector = WatchToIosConnector.shared
    
    init() {
        connector.$currentSong
            .receive(on: DispatchQueue.main)
            .assign(to: &$currentSong)
    }
    
    func togglePlayPause() {
        connector.sendPlayPauseCommand()
    }
    
}
