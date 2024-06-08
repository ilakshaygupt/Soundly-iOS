//
//  GetSongAction.swift
//  Soundly
//
//  Created by Lakshay Gupta on 08/06/24.
//

import Foundation

struct GetSongAction{
    let path = "/music/api/getsong/"
    let method: HTTPMethod = .get

    func call(
        query: String,
        completion: @escaping (SongDetailsResponse) -> Void,
        failure: @escaping (APIError) -> Void
    ) {
        let headers = ["Authorization": "Bearer \(Auth.shared.getAccessToken() ?? "")"]
        let queryPath = "\(path)\(query)/"


        APIRequest<SongRequest, SongDetailsResponse>.call(
            path: queryPath,
            method: method,
            headers: headers,
            completion: { data in
                if let response = try? JSONDecoder().decode(SongDetailsResponse.self, from: data) {
                    completion(response)
                } else {
                    failure(.jsonDecoding)
                }
            },
            failure: { error in
                failure(error)
            }
        )
    }
}
