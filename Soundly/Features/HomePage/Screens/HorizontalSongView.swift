//
//  HorizontalSongView.swift
//  Soundly
//
//  Created by Lakshay Gupta on 06/06/24.
//

import SwiftUI
import NetworkImage


struct HorizontalSongView: View {
    @StateObject private var viewModel = HorizontalSongViewModel()

    var body: some View {
        VStack {
            HStack {
                Text("FOR YOU")
                    .font(.system(size: 26))
                    .bold()
                Spacer()
            }
            .padding()

            if viewModel.isLoading {
                ShimmerView()
            } else {
                ScrollView(.horizontal, showsIndicators: false) {
                    ScrollViewReader { value in
                        LazyHStack {
                            ForEach(viewModel.publicSongs, id: \.id) { song in
                                SongCardView(song: song)
                            }
                        }
                        .onAppear {
                            if getDirection() == .rightToLeft {
                                value.scrollTo(viewModel.publicSongs.count - 1)
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            viewModel.fetchPublicSongs()
        }
    }

    private func getDirection() -> Locale.LanguageDirection? {
        guard let language = Locale.current.languageCode else { return nil }
        let direction = Locale.characterDirection(forLanguage: language)
        return direction
    }
}


struct HorizontalSongView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalSongView()
    }
}
