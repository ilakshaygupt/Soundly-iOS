//
//  SongDataModel.swift
//  Soundly
//
//  Created by Lakshay Gupta on 07/06/24.
//

import Foundation


struct SongData: Codable {
    let id: Int
    let name: String
    let song_url: String
    let thumbnail_url: String
    let is_liked: Bool
    let lyrics_url: String?
    let song_duration: String
    let lyrics_json: String?
    var durationInSeconds: Double {
        let components = song_duration.split(separator: ":")
        guard components.count == 2,
              let minutes = Double(components[0]),
              let seconds = Double(components[1]) else {
            return 0
        }
        return (minutes * 60) + seconds
    }
    static let defaulty = SongData(id: 59, name: "Brown Rang", song_url: "http://res.cloudinary.com/ds9i3o1hj/video/upload/v1699643615/govkwctv3ruygncrqlnl.mp3", thumbnail_url: "http://res.cloudinary.com/ds9i3o1hj/image/upload/v1699643612/euzlwq1tmtwbxlnr1vzr.jpg", is_liked: true, lyrics_url: nil, song_duration: "02:59", lyrics_json: nil)

}

