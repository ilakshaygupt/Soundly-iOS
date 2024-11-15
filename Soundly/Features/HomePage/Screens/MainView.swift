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
    init() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = UIColor(red: 213/255, green: 234/255, blue: 234/255, alpha: 1)

        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
    }


    var body: some View {
            ZStack {
                TabView {
                    NowPlayingBars(content:   HomePageScreen()
                      )
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                    .zIndex(1)

                    NowPlayingBars(content: LibraryScreen())
                        .tabItem {
                            Image(systemName: "books.vertical.fill")
                            Text("Library")
                        }
                        .zIndex(2)
                    NowPlayingBars(content: SearchScreen())
                        .tabItem {
                            Image(systemName: "magnifyingglass")
                            Text("Search")
                        }
                        .zIndex(3)
                    NowPlayingBars(content: GameView())
                        .tabItem {
                            Image(systemName: "gamecontroller.fill")
                            Text("Game")
                        }
                        .zIndex(4)
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

struct NowPlayingBars<Content: View>: View {
    var content: Content

    @ViewBuilder var body: some View {
        ZStack(alignment: .bottom) {
            content
            NowPlayingBar()
        }

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
