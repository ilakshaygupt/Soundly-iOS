//
//  PlaylistSongsResponse.swift
//  Soundly
//
//  Created by Lakshay Gupta on 08/06/24.
//

import Foundation



struct PlaylistSongsResponse: Decodable {
    let success: Bool
    let message: String
    let data: PlaylistSongsData

    struct PlaylistSongsData: Decodable {
        let playlist: Playlist
        let songs: [Song]
    }
}

struct Playlist: Decodable {
    let name: String
    let id: Int
    let description: String
    let thumbnail_url: String
    let uploader: String
    let totalduration: String
}

