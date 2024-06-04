//
//  SignUpAction.swift
//  Soundly
//
//  Created by Lakshay Gupta on 04/06/24.
//

import Foundation

struct SignupAction {
    let path = "/user/register/email/"
    let method: HTTPMethod = .post
       var parameters: SignupRequest
       
       func call(
           completion: @escaping (SignupResponse) -> Void,
           failure: @escaping (APIError) -> Void
       ) {
           APIRequest<SignupRequest, SignupResponse>.call(
               path: path,
               method: .post,
               parameters: parameters
           ) { data in
               if let response = try? JSONDecoder().decode(
                   SignupResponse.self,
                   from: data
               ) {
                   print(response)
                   completion(response)
               } else {
                   failure(.jsonDecoding)
               }
           } failure: { error in
               failure(error)
           }
       }
   }
