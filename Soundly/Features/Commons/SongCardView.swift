//
//  SongCardView.swift
//  Soundly
//
//  Created by Lakshay Gupta on 07/06/24.
//
import SwiftUI
import Combine

struct SongCardView: View {
    @State private var showingSheet = false
    let song: Song
    @State private var isLoading = true
    @State private var songData: SongData?
    @EnvironmentObject var currentSongViewModel: PlayerControlsLogic
    

    var body: some View {
        VStack {
            if isLoading {
                ShimmerView()
            } else {
                AsyncImage(url: URL(string: song.thumbnail_url)) { image in
                    image
                        .resizable()
                        .cornerRadius(10)
                        .frame(width: 180, height: 180)
                } placeholder: {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .controlSize(.large)
                }
                Text(song.name)
                    .font(.title2)
            }
        }
        .onTapGesture {
            fetchSongDetails()
        }
        .sheet(isPresented: $showingSheet) {

                SongSheetView()
            
        }
        .onAppear {
            isLoading = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                isLoading = false
            }
        }
        .frame(width: 200, height: 200)
        .padding()
    }

    func fetchSongDetails() {
        // Check if the song is already the current song
        if let currentSong = currentSongViewModel.currentSong, currentSong.id == self.song.id {
            self.showingSheet = true
        } else {
            // Fetch and play the song using loadAndPlaySong
            currentSongViewModel.loadAndPlaySong(by: song.id)
            self.showingSheet = true
        }
    }
}

struct SongCardView_Previews: PreviewProvider {
    static var previews: some View {
        SongCardView(song: Song(
            id: 59,
            name: "Brown Rang",
            uploader: "admin",
            language: "punjabi",
            song_duration: "02:59",
            mood: "upbeat",
            genre: "Hip-Hop",
            thumbnail_url: "http://res.cloudinary.com/ds9i3o1hj/image/upload/v1699643612/euzlwq1tmtwbxlnr1vzr.jpg",
            artist: "Honey Singh",
            is_private: false,
            is_liked: false
        ))
    }
}
