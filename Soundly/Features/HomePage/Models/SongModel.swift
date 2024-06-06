//
//  SongModel.swift
//  Soundly
//
//  Created by Lakshay Gupta on 06/06/24.
//

import Foundation


struct Song: Identifiable, Decodable {
    let id: Int
    let name: String
    let uploader: String
    let language: String
    let song_duration: String
    let mood: String
    let genre: String
    let thumbnail_url: String
    let artist: String
    let is_private: Bool
    let is_liked: Bool
    
    
    
}

