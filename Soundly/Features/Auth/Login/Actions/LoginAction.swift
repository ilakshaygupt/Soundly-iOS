//
//  LoginAction.swift
//  Soundly
//
//  Created by Lakshay Gupta on 04/06/24.
//

import Foundation



struct LoginAction {
    let path = "/user/login/"
    let method: HTTPMethod = .post
       var parameters: LoginRequest
       
       func call(
           completion: @escaping (LoginResponse) -> Void,
           failure: @escaping (APIError) -> Void
       ) {
           APIRequest<LoginRequest, LoginResponse>.call(
               path: path,
               method: .post,
               parameters: parameters
           ) { data in
               if let response = try? JSONDecoder().decode(
                                LoginResponse.self,
                   from: data
               ) {
                   print(response)
                   completion(response)
               } else {

                   failure(.jsonDecoding)
               }
           } failure: { error in
               print(error)
               failure(error)
           }
       }
   }
