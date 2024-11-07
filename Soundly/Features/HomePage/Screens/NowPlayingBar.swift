//
//  NowPlayingBar.swift
//  Soundly
//
//  Created by Lakshay Gupta on 07/11/24.
//

import Foundation
import SwiftUI
import AVKit
import Combine

struct NowPlayingBar : View {
    @ObservedObject var currentSong = CurrentSongViewModel.shared

    var body : some View {
        HStack {




                AsyncImage(url: URL(string: currentSong.currentSong?.thumbnail_url ?? "")) { image in
                    image
                        .resizable()
                        .cornerRadius(5)
                        .frame(width: 46, height: 46)
                        .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
                } placeholder: {
                    if let thumbnailUrl = currentSong.currentSong?.thumbnail_url, !thumbnailUrl.isEmpty {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                            .controlSize(.large)
                            .frame(width: 46, height: 46)
                    } else {
                        Image(systemName: "music.note")
                            .frame(width: 46, height: 46)
                            .cornerRadius(5)
                            .foregroundColor(.gray)
                    }

                }



            VStack(alignment: .leading, spacing: 4) {
                Text(currentSong.currentSong?.name ?? "")
                    .font(.headline)
                    .foregroundColor(.white)
//                Text(currentSong.currentSong?. ?? "")
//                    .font(.subheadline)
//                    .foregroundColor(.white.opacity(0.7))
            }

            Spacer()

            HStack(spacing: 16) {
                Button(action: {
                    // Previous song action
                }) {
                    Image(systemName: "backward.fill")
                        .font(.title2)
                        .foregroundColor(.white)
                }

                Button(action: {
                    if currentSong.isPlaying {
                        currentSong.pause()
                    } else {
                        currentSong.play()
                    }
                }) {
                    Image(systemName: currentSong.isPlaying ? "pause.fill" : "play.fill")
                        .font(.title2)
                        .foregroundColor(.white)
                }

                Button(action: {
                    // Next song action
                }) {
                    Image(systemName: "forward.fill")
                        .font(.title2)
                        .foregroundColor(.white)
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .frame(height: 64)
        .background(Color(red: 0/255, green: 139/255, blue: 139/255))

//        .frame(minWidth: 0, maxWidth: .infinity, hei: 80, alignment: .center)
        .onAppear {
            UITabBar.appearance().barTintColor = UIColor(red: 213/255, green: 234/255, blue: 231/255, alpha: 1)
            UITabBarAppearance().backgroundColor = UIColor(red: 213/255, green: 234/255, blue: 231/255, alpha: 1)
        }
    }
    private func formatTime(seconds: Double) -> String {
        let minutes = Int(seconds) / 60
        let seconds = Int(seconds) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
