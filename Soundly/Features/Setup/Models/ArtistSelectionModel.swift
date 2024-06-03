//
//  ArtistSelectionModel.swift
//  Soundly
//
//  Created by Lakshay Gupta on 03/06/24.
//

import Foundation


struct ArtistSelectionModel : Hashable {
    
    let name : String
    
    
}
struct ArtistSelectionData{
    
    
    static let artistData = [
        ArtistSelectionModel(name: "Arijit Singh"),
        ArtistSelectionModel(name: "Neha Kakkar"),
        ArtistSelectionModel(name: "Dhvani Bhanushali"),
        ArtistSelectionModel(name: "Darshan Raval"),
        ArtistSelectionModel(name: "Honey Singh"),
        ArtistSelectionModel(name: "Badshah"),
    ]
}



