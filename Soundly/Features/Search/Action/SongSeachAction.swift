//
//  SongSeachAction.swift
//  Soundly
//
//  Created by Lakshay Gupta on 07/06/24.
//

import Foundation

struct SongSeachAction {
    let path = "/music/api/songsearch/"
    let method: HTTPMethod = .get

    func call(
        query: String,
        completion: @escaping (SongResponse) -> Void,
        failure: @escaping (APIError) -> Void
    ) {
        let headers = ["Authorization": "Bearer \(Auth.shared.getAccessToken() ?? "")"]
        let queryPath = "\(path)?query=\(query)"
        APIRequest<SongRequest, SongResponse>.call(
            path: queryPath,
            method: method,
            headers: headers,
            completion: { data in
                if let response = try? JSONDecoder().decode(SongResponse.self, from: data) {
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
