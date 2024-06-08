//
//  MainView.swift
//  Soundly
//
//  Created by Lakshay Gupta on 07/06/24.
//

import SwiftUI


struct MainView: View {
    @ObservedObject var currentSong = CurrentSongViewModel.shared
    var body: some View {

        NavigationStack{
            ZStack{
                TabView {
                    HomePageScreen()
                        .tabItem {
                            Image(systemName: "house.fill")
                            Text("Home")
                        }
                    HomePageScreen()
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
//                    Rectangle()
                    HStack {
                        Text(String(currentSong.currentTime))
                        Text(String(currentSong.currentSong?.song_duration ?? ""))
                        if let song = currentSong.currentSong {
                            Text("Now Playing:")
                            Text(song.name)
                                .font(.headline)
                        } else {
                            Text("No song is currently playing.")
                        }
                    }
                        .frame(maxWidth: .infinity, maxHeight: 40)
                        .background(.teal)
                        .foregroundColor(.red)
                        .padding(.bottom, 60)
                        
                }

                .onAppear() {
                    UITabBar.appearance().barTintColor = UIColor(red: 213/255, green: 234/255, blue: 231/255,alpha: 1)
                    UITabBarAppearance().backgroundColor = UIColor(red: 213/255, green: 234/255, blue: 231/255,alpha: 1)
                }
                .accentColor(Color(red: 0/255, green: 139/255, blue: 139/255))
            }
        }

    }
}


struct LibraryView: View {
    var body: some View {
        Text("Library")
    }
}

struct SearchView: View {
    var body: some View {
        Text("Search")
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
