//
//  APIRequest.swift
//  Soundly
//
//  Created by Lakshay Gupta on 04/06/24.
//

import Foundation

typealias CompletionHandler = (Data) -> Void
typealias FailureHandler = (APIError) -> Void

enum HTTPMethod: String {
    case get
    case put
    case delete
    case post
}

class APIRequest<Parameters: Encodable, Model: Decodable> {
    
    static func call(
        path: String,
        method: HTTPMethod,
        parameters: Parameters? = nil,
        headers: [String: String]? = nil,
        completion: @escaping CompletionHandler,
        failure: @escaping FailureHandler
    ) {
        
        let url = URL(string: "https://soundly.weblakshay.tech\(path)")
        
        var request = URLRequest(url: url!)
        request.httpMethod = method.rawValue
        
        headers?.forEach { key, value in
                    request.addValue(value, forHTTPHeaderField: key)
                }
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("true", forHTTPHeaderField: "x-mock-match-request-body")
        
        if let parameters = parameters {
            request.httpBody = try? JSONEncoder().encode(parameters)
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            if let data = data {
                print(data)
                completion(data)
            } else {
                if error != nil {
                    print(APIError.response)
                    failure(APIError.response)
                }
            }
        }
        task.resume()
    }
}
