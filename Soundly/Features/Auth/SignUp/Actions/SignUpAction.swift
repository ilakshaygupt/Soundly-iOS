//
//  SignUpAction.swift
//  Soundly
//
//  Created by Lakshay Gupta on 04/06/24.
//

import Foundation

struct SignupEmailAction {
    let path = "/user/register/email/"
    let method: HTTPMethod = .post
       var parameters: SignupEmailRequest
       
       func call(
           completion: @escaping (SignupResponse) -> Void,
           failure: @escaping (APIError) -> Void
       ) {
           APIRequest<SignupEmailRequest, SignupResponse>.call(
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
               print(error)
               failure(error)
           }
       }
   }



struct SignupPhoneAction {
    let path = "/user/register/phone/"
    let method: HTTPMethod = .post
       var parameters: SignupPhoneRequest
       
       func call(
           completion: @escaping (SignupResponse) -> Void,
           failure: @escaping (APIError) -> Void
       ) {
           APIRequest<SignupPhoneRequest, SignupResponse>.call(
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
