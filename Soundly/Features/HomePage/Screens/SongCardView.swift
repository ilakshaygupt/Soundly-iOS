//
//  SongCardView.swift
//  Soundly
//
//  Created by Lakshay Gupta on 06/06/24.
//

import SwiftUI

struct SongCardView: View {
    let song: Song
    @State private var isLoading = true

    var body: some View {
        VStack {
            if isLoading {
                ShimmerView()
            } else {
                AsyncImage(url: URL(string: song.thumbnail_url)) { image in
                    image
                        .resizable()
                        .cornerRadius(10)
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .controlSize(.large)
                }
                Text(song.artist)
                    .font(.title2)
            }
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
}
//
//
//#Preview {
//    SongCardView(song: <#T##Song#>(n))
//}
