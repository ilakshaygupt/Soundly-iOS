//
//  SongDetailsResponse.swift
//  Soundly
//
//  Created by Lakshay Gupta on 07/06/24.
//

import Foundation
struct SongDetailsResponse: Codable {
    let success: Bool
    let message: String
    let data: SongData?
}
