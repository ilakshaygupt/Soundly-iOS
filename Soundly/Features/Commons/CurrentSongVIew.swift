//
//  CurrentSongVIew.swift
//  Soundly
//
//  Created by Lakshay Gupta on 16/11/24.
//

import Foundation

import SwiftUI
import SwiftUI

struct CurrentSongView: View {
    @ObservedObject var currentSong = PlayerControlsLogic.shared

    var body: some View {
        VStack {
            if let song = currentSong.currentSong {
                // Display song details here
                Text(song.name)
                    .font(.largeTitle)
//                Text(song.artist ?? "Unknown Artist")
//                    .font(.title)

                // Play/Pause button or other song controls
                Button(action: {
                    currentSong.togglePlayPause()
                }) {
                    Text(currentSong.isPlaying ? "Pause" : "Play")
                }
            } else {
                Text("No song currently playing")
            }
        }
        .padding()
    }
}
