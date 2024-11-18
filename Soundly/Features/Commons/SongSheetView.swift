//
//  SongSheetView.swift
//  Soundly
//
//  Created by Lakshay Gupta on 07/06/24.
//

import SwiftUI
import AVKit
import SwiftUI
import AVKit
import SwiftUI
import AVKit
import SwiftUI
import AVKit

struct SongSheetView: View {
    @EnvironmentObject var currentSongViewModel: PlayerControlsLogic // Accessing PlayerControlsLogic via environment object

    var body: some View {
        VStack {
            // Ensure song is available
            if let song = currentSongViewModel.currentSong {
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

    }
}

#Preview {
    SongSheetView() // No need to pass a song explicitly; it will use the shared song data.
}
