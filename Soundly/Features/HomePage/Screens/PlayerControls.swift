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

struct PlayerControls: View {
    @StateObject var currentSong = CurrentSongViewModel.shared
    let song: SongData

    init(song: SongData, player: AVPlayer) {
        self.song = song
        if currentSong.currentSong?.id != song.id {

            if let player = currentSong.player {
                player.pause()
                currentSong.isPlaying = false
            }
            
            currentSong.currentSong = song
            currentSong.player = player
            currentSong.isPlaying = true
        }
        else{
            

        }


    }

    var body: some View {
        VStack {
            HStack {
                Text(formatTime(seconds: currentSong.currentTime))
                    .font(.caption)
                Slider(
                    value: $currentSong.currentTime,
                    in: 0...song.durationInSeconds,
                    step: 1.0,
                    onEditingChanged: { editing in
                        currentSong.isDragging = editing
                        if !editing {
                            currentSong.player!.seek(to: CMTime(seconds: currentSong.currentTime, preferredTimescale: 1))
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
                    if currentSong.isPlaying {
                        currentSong.player!.pause()
                    } else {
                        currentSong.player!.play()
                    }
                    currentSong.isPlaying.toggle()
                }) {
                    Image(systemName: currentSong.isPlaying ? "pause.circle" : "play.circle")
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
        .onReceive(currentSong.player!.currentTimePublisher) { time in
            if !currentSong.isDragging {
                currentSong.currentTime = time
            }
        }
    }

    private func formatTime(seconds: Double) -> String {
        let minutes = Int(seconds) / 60
        let seconds = Int(seconds) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

extension AVPlayer {
    var currentTimePublisher: AnyPublisher<Double, Never> {
        Timer.publish(every: 0.5, on: .main, in: .default)
            .autoconnect()
            .map { [weak self] _ in
                self?.currentTime().seconds ?? 0
            }
            .eraseToAnyPublisher()
    }
}
