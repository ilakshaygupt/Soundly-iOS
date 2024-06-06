//
//  HorizontalSongViewModel.swift
//  Soundly
//
//  Created by Lakshay Gupta on 07/06/24.
//

import Foundation


class HorizontalSongViewModel: ObservableObject {
    @Published var publicSongs: [Song] = []
    @Published var isLoading = true

    func fetchPublicSongs() {
        PublicSongsAction().call(
            completion: { response in
                DispatchQueue.main.async {
                    self.publicSongs = response.data
                    self.isLoading = false
                }
            },
            failure: { error in
                print("Failed to fetch public songs: \(error)")
            }
        )
    }
}
