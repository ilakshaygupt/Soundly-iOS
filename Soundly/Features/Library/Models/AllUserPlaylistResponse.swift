//
//  AllUserPlaylistResponse.swift
//  Soundly
//
//  Created by Lakshay Gupta on 08/06/24.
//

import Foundation


struct AllUserPlaylistResponse : Decodable {
    let success: Bool
    let message: String
    let data: [LibraryPlaylistModel]

}
