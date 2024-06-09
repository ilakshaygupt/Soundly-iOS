//
//  PlaylistSongsAction.swift
//  Soundly
//
//  Created by Lakshay Gupta on 08/06/24.
//

import Foundation




struct PlaylistSongsAction{
    let path = "/music/api/playlists/"
    let method: HTTPMethod = .get

    func call(
        query: String,
        completion: @escaping (PlaylistSongsResponse) -> Void,
        failure: @escaping (APIError) -> Void
    ) {
        let headers = ["Authorization": "Bearer \(Auth.shared.getAccessToken() ?? "")"]
        let queryPath = "\(path)\(query)/songs/"


        APIRequest<PlaylistSongsRequest, PlaylistSongsResponse>.call(
            path: queryPath,
            method: method,
            headers: headers,
            completion: { data in
                if let response = try? JSONDecoder().decode(PlaylistSongsResponse.self, from: data) {
                        print(1)
                    completion(response)
                } else {
                    print(2)
                    failure(.jsonDecoding)
                }
            },
            failure: { error in
                print(error)
                failure(error)
            }
        )
    }
}
