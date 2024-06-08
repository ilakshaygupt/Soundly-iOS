//////
//////  GlobalMusicPlayerView.swift
//////  Soundly
//////
//////  Created by Lakshay Gupta on 07/06/24.
//////
////import SwiftUI
////
////struct GlobalMusicPlayerView: View {
////    @ObservedObject var musicPlayerManager = MusicPlayerManager.shared
////
////    var body: some View {
////        if let song = musicPlayerManager.song {
////            
////            VStack {
////                Spacer()
////                HStack {
////                    AsyncImage(url: URL(string: song.thumbnail_url)) { image in
////                        image
////                            .resizable()
////                            .aspectRatio(contentMode: .fit)
////                            .cornerRadius(5)
////                            .frame(width: 50, height: 50)
////                    } placeholder: {
////                        ProgressView()
////                            .progressViewStyle(CircularProgressViewStyle())
////                            .controlSize(.large)
////                    }
////
////                    VStack(alignment: .leading) {
////                        Text(song.name)
////                            .font(.headline)
////                        Text(song.song_duration)
////                            .font(.subheadline)
////                            .foregroundColor(.gray)
////                    }
////
////                    Spacer()
////
////                    Button(action: {
////                        musicPlayerManager.togglePlayPause()
////                    }) {
////                        Image(systemName: musicPlayerManager.isPlaying ? "pause.circle" : "play.circle")
////                            .font(.system(size: 40))
////                            .accentColor(.black)
////                    }
////                }
////                .padding()
////                .background(Color.white)
////                .cornerRadius(10)
////                .shadow(radius: 5)
////                .padding()
////            }
////        }
////    }
////}
////
////struct ContentsView: View {
////    var body: some View {
////        ZStack {
////            // Your main content goes here
////            Text("Main Content")
////                .frame(maxWidth: .infinity, maxHeight: .infinity)
////                .background(Color(UIColor.systemBackground))
////
////            VStack {
////                Spacer()
////                GlobalMusicPlayerView()
////            }
////            .edgesIgnoringSafeArea(.bottom)
////        }
////    }
////}
////
////#Preview {
////    ContentsView()
////}
//import SwiftUI
//
//
//

