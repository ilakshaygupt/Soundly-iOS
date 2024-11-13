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
                            NavigationLink(destination:ContentContainer( content:  PlaylistDetailView(playlist: viewModel.allPlaylists[index]))) {
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

                        NavigationLink(destination:CreatePlaylistScreen()){
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
                viewModel.fetchSongs()
            }
        }
    }
}

#Preview {
    LibraryScreen()
}

