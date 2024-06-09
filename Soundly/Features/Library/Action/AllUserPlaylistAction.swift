//
//  AllUserPlaylistAction.swift
//  Soundly
//
//  Created by Lakshay Gupta on 08/06/24.
//

import Foundation

struct AllUserPlaylistAction{
    let path = "/music/api/playlists/"
    let method: HTTPMethod = .get

    func call(
        completion: @escaping (AllUserPlaylistResponse) -> Void,
        failure: @escaping (APIError) -> Void
    ) {
        let headers = ["Authorization": "Bearer \(Auth.shared.getAccessToken() ?? "")"]

        APIRequest<AllUserPlaylstRequest, AllUserPlaylistResponse>.call(
            path: path,
            method: method,
            headers: headers,
            completion: { data in
                if let response = try? JSONDecoder().decode(AllUserPlaylistResponse.self, from: data) {

                    completion(response)
                } else {
                        print("here")
                    failure(.jsonDecoding)
                }
            },
            failure: { error in
                failure(error)
            }
        )
    }
}
