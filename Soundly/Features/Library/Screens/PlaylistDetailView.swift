//
//  PlaylistDetailView.swift
//  Soundly
//
//  Created by Lakshay Gupta on 08/06/24.
//

import SwiftUI


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
                        SongCardView(song: song)
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
