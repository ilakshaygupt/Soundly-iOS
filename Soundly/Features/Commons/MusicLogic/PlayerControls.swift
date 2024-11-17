//
//  PlayerControls.swift
//  Soundly
//
//  Created by Lakshay Gupta on 07/06/24.
//
import Foundation
import SwiftUI
import AVKit
import Combine
import SwiftUI
import SwiftUI

struct PlayerControls: View {
    @EnvironmentObject var logic: PlayerControlsLogic

    let song: SongData

    var body: some View {
        VStack {
            HStack {
                Text(formatTime(seconds: logic.currentTime))
                    .font(.caption)
                Slider(
                    value: $logic.currentTime,
                    in: 0...song.durationInSeconds,
                    step: 1.0,
                    onEditingChanged: { editing in
                        logic.isDragging = editing
                        if !editing {
                            logic.seek(to: logic.currentTime)
                        }
                    }
                )
                .accentColor(Color(red: 0/255, green: 139/255, blue: 139/255, opacity: 1))
                Text(formatTime(seconds: song.durationInSeconds))
                    .font(.caption)
            }

            HStack(spacing: 25) {
                Button(action: {
                    // Implement shuffle action
                }) {
                    Image(systemName: "shuffle")
                        .font(.system(size: 30))
                        .accentColor(Color(red: 0/255, green: 139/255, blue: 139/255, opacity: 1))
                }

                Button(action: {
                    // Implement previous song action
                }) {
                    Image(systemName: "backward.fill")
                        .font(.system(size: 30))
                        .accentColor(.black)
                }

                Button(action: {
                    logic.togglePlayPause()
                }) {
                    Image(systemName: logic.isPlaying ? "pause.circle" : "play.circle")
                        .font(.system(size: 40))
                        .accentColor(.black)
                }

                Button(action: {
                    // Implement next song action
                }) {
                    Image(systemName: "forward.fill")
                        .font(.system(size: 30))
                        .accentColor(.black)
                }

                Button(action: {
                    // Implement repeat song action
                }) {
                    Image(systemName: "repeat")
                        .font(.system(size: 30))
                        .accentColor(Color(red: 0/255, green: 139/255, blue: 139/255, opacity: 1))
                }
            }
            .padding(.top)
        }
    }

    private func formatTime(seconds: Double) -> String {
        let minutes = Int(seconds) / 60
        let seconds = Int(seconds) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
