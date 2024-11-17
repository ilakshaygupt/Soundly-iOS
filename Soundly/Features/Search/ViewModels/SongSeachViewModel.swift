
//
//  SongSeachViewModel.swift
//  Soundly
//
//  Created by Lakshay Gupta on 07/06/24.
//

import Foundation

import SwiftUI

class SongSeachViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var songs: [Song] = []
    @Published var errorMessage: String?

    private let songSearchAction = SongSeachAction()

    func searchSongs() {
        songSearchAction.call(
            query: searchText,
            completion: { response in
                self.songs = response.data
                self.errorMessage = nil
            },
            failure: { error in
                self.errorMessage = error.localizedDescription
            }
        )
    }
}
