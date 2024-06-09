//
//  HomePageScreen.swift
//  Soundly
//
//  Created by Lakshay Gupta on 03/06/24.
//

import SwiftUI
import AVKit
struct HomePageScreen: View {
//    @ObservedObject var currentSong = CurrentSongViewModel.shared

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    SliderView()
                        .frame(height: getScreenBounds().width * 0.9)
                        .cornerRadius(40)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                    HorizontalSongsView()
//                    VStack {
//                        Text(String(currentSong.isPlaying))
//                        if let song = currentSong.currentSong {
//                            Text("Now Playing:")
//                            Text(song.name)
//                                .font(.headline)
//                        } else {
//                            Text("No song is currently playing.")
//                        }
//                    }
                    Spacer()
                }
                .padding(5)
                
            }
        }
    }
    
}


#Preview {
    HomePageScreen()
}
