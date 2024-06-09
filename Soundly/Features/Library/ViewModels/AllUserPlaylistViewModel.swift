//
//  AllUserPlaylistViewModel.swift
//  Soundly
//
//  Created by Lakshay Gupta on 08/06/24.
//
import Foundation
import Combine
import Foundation
import Combine

class AllUserPlaylistViewModel: ObservableObject {

    @Published var allPlaylists: [LibraryPlaylistModel] = []
    @Published var errorMessage: String?

    private let songSearchAction = AllUserPlaylistAction()

    func fetchSongs() {
        songSearchAction.call(
            completion: { response in
                DispatchQueue.main.async {


                    self.allPlaylists = response.data
                    self.errorMessage = nil
                }
            },
            failure: { error in
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                }
            }
        )
    }
}
