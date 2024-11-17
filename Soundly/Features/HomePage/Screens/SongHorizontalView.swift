//
//  SongVerticalView.swift
//  Soundly
//
//  Created by Lakshay Gupta on 07/06/24.
//
import SwiftUI
import AVKit

struct SongHorizontalView: View {
    @State private var showingSheet = false
    let song: Song
    @State private var isLoading = true
    @State private var player: AVPlayer?
    @State private var songData: SongData?

    @EnvironmentObject var currentSongViewModel: PlayerControlsLogic

    var body: some View {
        VStack(spacing: 8) {
            if isLoading {
                ShimmerView()
            } else {
                HStack(spacing: 18) {
                    AsyncImage(url: URL(string: song.thumbnail_url)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                            .frame(width: getScreenBounds().width * 0.15, height:  getScreenBounds().width * 0.15, alignment: .leading)
                    } placeholder: {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                            .controlSize(.large)
                    }
                    Text(song.name)
                        .font(.title2)
                        .foregroundColor(.black)
                        .lineLimit(1)
                    Spacer()
                    Text(song.song_duration)
                        .font(.subheadline)
                        .foregroundColor(.gray)

                    Button(action: {
                        fetchSongDetails()
                    }) {
                        Image(systemName: "play.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .accentColor(.black)
                    }
                }
                .onTapGesture {
                    fetchSongDetails()
                    showingSheet.toggle()
                }
                .sheet(isPresented: $showingSheet) {
                    if let player = player, let songData = songData {
                        SongSheetView()
                    }
                }

            }

        }
        .padding(.horizontal, getScreenBounds().width * 0.05)
        .onAppear {
            isLoading = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                isLoading = false
            }
        }
    }

    func fetchSongDetails() {
        // Check if the current song is the same as the tapped song
        if let currentSong = currentSongViewModel.currentSong, currentSong.id == self.song.id {
            DispatchQueue.main.async {
                self.showingSheet = true
            }
        } else {
            // Fetch and play the song using loadAndPlaySong
            currentSongViewModel.loadAndPlaySong(by: song.id)

            DispatchQueue.main.async {
                self.showingSheet = true
            }
        }
    }

}

struct SongHorizontalView_Previews: PreviewProvider {
    static var previews: some View {
        SongHorizontalView(song: Song(id: 59, name: "Brown Rang", uploader: "admin", language: "punjabi", song_duration: "02:59", mood: "upbeat", genre: "Hip-Hop", thumbnail_url: "http://res.cloudinary.com/ds9i3o1hj/image/upload/v1699643612/euzlwq1tmtwbxlnr1vzr.jpg", artist: "Honey Singh", is_private: false, is_liked: false))
    }
}
