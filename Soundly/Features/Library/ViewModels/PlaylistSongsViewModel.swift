//
//  PlaylistSongsViewModel.swift
//  Soundly
//
//  Created by Lakshay Gupta on 08/06/24.
//

import Foundation


class PlaylistSongsViewModel : ObservableObject {

    @Published var songs: [Song] = []
    @Published var errorMessage: String?

    private let songSearchAction = PlaylistSongsAction()

    func getPlaylistSongs(id : String) {
        songSearchAction.call(
            query: id,
            completion: { response in
                self.songs = response.data.songs
                print(response.data)
                self.errorMessage = nil
            },
            failure: { error in
                self.errorMessage = error.localizedDescription
            }
        )
    }
}
