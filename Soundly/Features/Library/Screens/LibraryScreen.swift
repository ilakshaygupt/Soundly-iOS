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
        NavigationStack {
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
                                }
                                .padding()
                                .background(Color(.systemBackground))
                                .cornerRadius(15)
                                .shadow(radius: 5)
                            }
                        }
                    }
                    .padding()
                }
            }
            .onAppear {
                viewModel.fetchSongs()
            }
        }
    }
}

#Preview {
    LibraryScreen()
}




struct PlaylistDetailView: View {
    let playlist: LibraryPlaylistModel
    @StateObject private var viewModel = PlaylistSongsViewModel()

    var body: some View {
        VStack {
            AsyncImage(url: playlist.thumbnail_url) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 300, maxHeight: 300)
            } placeholder: {
                ProgressView()
            }

            Text(playlist.name)
                .font(.largeTitle)
                .padding(.top)

            Text(playlist.description)
                .font(.body)
                .padding(.top, 8)

            Text("By \(playlist.uploader)")
                .font(.subheadline)
                .padding(.top, 4)


            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(viewModel.songs, id: \.id) { song in
                        SongHorizontalView(song: song)
                        Divider().background(Color.black).padding(.horizontal)
                    }
                }
                .padding(.horizontal)
            }


            Spacer()
        }
        .padding()
        .navigationTitle(playlist.name)
        .onAppear {
            viewModel.getPlaylistSongs(id: String(playlist.id))
        }
    }
}
