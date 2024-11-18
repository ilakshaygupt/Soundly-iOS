//
//  LibraryScreen.swift
//  Soundly
//
//  Created by Lakshay Gupta on 08/06/24.
//

import SwiftUI



struct LibraryScreen: View {
    @StateObject var viewModel = AllUserPlaylistViewModel()



    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]


    var body: some View {

            VStack {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(Array(viewModel.allPlaylists.indices), id: \.self) { index in
                            NavigationLink(destination: PlaylistDetailView(playlist: viewModel.allPlaylists[index])) {
                                VStack {
                                    AsyncImage(url: viewModel.allPlaylists[index].thumbnail_url) { image in
                                        image
                                            .resizable()
                                            .scaledToFit()
                                            .frame(maxWidth: 150, maxHeight: 150)
                                            .cornerRadius(10)
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    Text(viewModel.allPlaylists[index].name)
                                        .font(.headline)
                                        .padding(.top, 5)
                                        .multilineTextAlignment(.center)
                                } .padding()
                                    .background(Color(.systemBackground))
                                    .cornerRadius(15)
                                    .shadow(radius: 5)

                            }
                        }

                        NavigationLink(destination:NowPlayingBars(content:   CreatePlaylistScreen())){
                            Image("CreatePlaylistIllutration")
                                .padding()
                                .background(Color(.systemBackground))
                                .cornerRadius(15)
                                .shadow(radius: 5)
                        }

                    }
                    .padding()
                }
            }
            .onAppear {
                if viewModel.allPlaylists.isEmpty {
                    viewModel.fetchSongs()
                }
            }
        }

}

#Preview {
    LibraryScreen()
}

struct NowPlayingBars<Content: View>: View {
    var content: Content

    @EnvironmentObject var currentSongViewModel: PlayerControlsLogic

    var body: some View {
        HStack(alignment: .bottom) {
            content

            if let _ = currentSongViewModel.currentSong {
                NavigationLink(destination: CurrentSongView()
                ) {
                    NowPlayingBar()
                        .padding()
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
}

