//
//  LoginAction.swift
//  Soundly
//
//  Created by Lakshay Gupta on 04/06/24.
//
import Foundation

class LoginAction {
    static let shared = LoginAction()
    
    func login(username: String, password: String, completion: @escaping (Result<Data, Error>) -> Void) {
        let path = "/login"
        let bodyDict = ["username": username]
        
        do {
            let bodyData = try JSONSerialization.data(withJSONObject: bodyDict, options: [])
            
            APIService.shared.requestData(fromPath: path, method: "POST", body: bodyData) { result in
                completion(result)
            }
        } catch {
            completion(.failure(error))
        }
    }
}

