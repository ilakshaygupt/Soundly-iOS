//
//  OTPAction.swift
//  Soundly
//
//  Created by Lakshay Gupta on 04/06/24.
//

import Foundation


struct OTPAction {
    let path = "/user/verify/"
    let method: HTTPMethod = .post
       var parameters: OTPRequest
       
       func call(
           completion: @escaping (OTPResponse) -> Void,
           failure: @escaping (APIError) -> Void
       ) {
           APIRequest<OTPRequest, OTPResponse>.call(
               path: path,
               method: .post,
               parameters: parameters
           ) { data in
               if let response = try? JSONDecoder().decode(
                   OTPResponse.self,
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
