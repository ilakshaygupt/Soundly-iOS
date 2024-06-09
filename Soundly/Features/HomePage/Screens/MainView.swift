//
//  MainView.swift
//  Soundly
//
//  Created by Lakshay Gupta on 07/06/24.
//

import Foundation
import SwiftUI
import AVKit
import Combine



struct MainView: View {
    @ObservedObject var currentSong = CurrentSongViewModel.shared

    var body: some View {
        NavigationStack {
            ZStack {
                TabView {
                    HomePageScreen()
                        .tabItem {
                            Image(systemName: "house.fill")
                            Text("Home")
                        }
                    LibraryScreen()
                        .tabItem {
                            Image(systemName: "books.vertical.fill")
                            Text("Library")
                        }
                    SearchScreen()
                        .tabItem {
                            Image(systemName: "magnifyingglass")
                            Text("Search")
                        }
                    GameView()
                        .tabItem {
                            Image(systemName: "gamecontroller.fill")
                            Text("Game")
                        }
                }
                VStack {
                    Spacer()
                    HStack {
                        Text(formatTime(seconds: currentSong.currentTime))
                            .font(.caption)
                        Button(action: {
                            if currentSong.isPlaying {
                                currentSong.pause()
                            } else {
                                currentSong.play()
                            }
                        }) {
                            Image(systemName: currentSong.isPlaying ? "pause.circle" : "play.circle")
                                .font(.system(size: 40))
                                .accentColor(.black)
                        }
                        if let song = currentSong.currentSong {
                            Text("Now Playing:")
                            Text(song.name)
                                .font(.headline)
                        } else {
                            Text("No song is currently playing.")
                        }
                        Slider(
                            value: $currentSong.currentTime,
                            in: 0...(currentSong.currentSong?.durationInSeconds ?? 1.0),
                            step: 1.0,
                            onEditingChanged: { editing in
                                currentSong.isDragging = editing
                                if !editing {
                                    currentSong.seek(to: currentSong.currentTime)
                                }
                            }
                        )
                        .accentColor(Color(red: 0/255, green: 139/255, blue: 139/255, opacity: 1))
                        Text(formatTime(seconds: currentSong.currentSong?.durationInSeconds ?? 0))
                            .font(.caption)
                    }
                    .frame(maxWidth: .infinity, maxHeight: 40)
                    .background(.teal)
                    .foregroundColor(.black)
                    .padding(.bottom, 60)
                }
                .onAppear {
                    UITabBar.appearance().barTintColor = UIColor(red: 213/255, green: 234/255, blue: 231/255, alpha: 1)
                    UITabBarAppearance().backgroundColor = UIColor(red: 213/255, green: 234/255, blue: 231/255, alpha: 1)
                    currentSong.startTimer()
                }
                
                .accentColor(Color(red: 0/255, green: 139/255, blue: 139/255))
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Text("Hey, Lakshay")
                            .font(.system(size: 28))
                        Spacer()
                        Image("Honey Singh")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                    }
                    .padding(.bottom,3)
                }

            }.navigationBarTitleDisplayMode(.inline)
        }
    }

    private func formatTime(seconds: Double) -> String {
        let minutes = Int(seconds) / 60
        let seconds = Int(seconds) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

struct GameView: View {
    var body: some View {
        Text("Game")
    }
}

#Preview {
    MainView()
}
