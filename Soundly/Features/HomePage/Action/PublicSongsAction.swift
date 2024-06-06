//
//  PublicSongsAction.swift
//  Soundly
//
//  Created by Lakshay Gupta on 06/06/24.
//

import Foundation


struct PublicSongsAction {
    let path = "/music/api/allpublicsongs/"
    let method: HTTPMethod = .get
       
    func call(
        completion: @escaping (SongResponse) -> Void,
        failure: @escaping (APIError) -> Void
    ) {
        let headers = ["Authorization": "Bearer \(Auth.shared.getAccessToken() ?? "")"]
        print(headers)
        APIRequest<SongRequest, SongResponse>.call(
            path: path,
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
