//
//  HorizontalSongView.swift
//  Soundly
//
//  Created by Lakshay Gupta on 06/06/24.
//

import SwiftUI
import NetworkImage


struct HorizontalSongsView: View {
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
            ScrollView(.horizontal, showsIndicators: false) {
                ScrollViewReader { value in
                    LazyHStack {
                        ForEach(viewModel.publicSongs, id: \.id) { song in
                            SongCardView(song: song)
                        }
                    }

                }
            }
        }
        .onAppear {
            viewModel.fetchPublicSongs()
        }
    }

}


struct HorizontalSongView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalSongsView()
    }
}
