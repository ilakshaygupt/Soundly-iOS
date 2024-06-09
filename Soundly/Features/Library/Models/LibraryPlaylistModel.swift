//
//  LibraryPlaylistViewModel.swift
//  Soundly
//
//  Created by Lakshay Gupta on 08/06/24.
//

import Foundation


struct LibraryPlaylistModel: Codable {
    let name: String
    let id: Int
    let description: String
    let thumbnail_url: URL
    let uploader: String
    let totalduration: String
}
