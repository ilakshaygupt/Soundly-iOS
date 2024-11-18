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
    @EnvironmentObject var currentSong : PlayerControlsLogic

    var body: some View {
        VStack {
            if currentSong.currentSong != nil {
                VStack {
                    // Ensure song is available
                    if let song = currentSong.currentSong {
                        AsyncImage(url: URL(string: song.thumbnail_url)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(10)
                                .scaledToFill()
                                .frame(width: getScreenBounds().width * 0.9, height: getScreenBounds().width * 0.9 )
                        } placeholder: {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle())
                                .controlSize(.large)
                        }

                        HStack {
                            Text(song.name)
                                .font(.largeTitle)
                                .bold()
                                .fontWeight(.heavy)
                            Spacer()
                            Image(systemName: song.is_liked ? "heart.fill" : "heart")
                                .font(.largeTitle)
                                .foregroundColor(song.is_liked ? .teal : .black)
                        }.padding(getScreenBounds().width * 0.05)

                        PlayerControls(song: song) // Player control for current song
                            .padding(getScreenBounds().width * 0.05)

                    } else {
                        Text("Loading song...")
                            .font(.title)
                            .foregroundColor(.gray)
                    }

                    Spacer()
                }.padding()
            } else {
                Text("No song currently playing")
            }
        }
        .padding()
    }
}
