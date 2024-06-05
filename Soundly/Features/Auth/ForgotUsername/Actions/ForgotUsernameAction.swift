//
//  ForgotUsernameAction.swift
//  Soundly
//
//  Created by Lakshay Gupta on 05/06/24.
//

import Foundation




struct ForgotUsernameEmailAction {
    let path = "/user/forgot-email/"
    let method: HTTPMethod = .post
       var parameters: ForgotUsernameEmailRequest
       
       func call(
           completion: @escaping (ForgotUsernameEmailResponse) -> Void,
           failure: @escaping (APIError) -> Void
       ) {
           APIRequest<ForgotUsernameEmailRequest, ForgotUsernameEmailResponse>.call(
               path: path,
               method: .post,
               parameters: parameters
           ) { data in
               if let response = try? JSONDecoder().decode(
                ForgotUsernameEmailResponse.self,
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





struct ForgotUsernamePhoneAction {
    let path = "/user/forgot-phone_number/"
    let method: HTTPMethod = .post
       var parameters: ForgotUsernamePhoneRequest
       
       func call(
           completion: @escaping (ForgotUsernamePhoneResponse) -> Void,
           failure: @escaping (APIError) -> Void
       ) {
           APIRequest<ForgotUsernamePhoneRequest, ForgotUsernamePhoneResponse>.call(
               path: path,
               method: .post,
               parameters: parameters
           ) { data in
               if let response = try? JSONDecoder().decode(
                ForgotUsernamePhoneResponse.self,
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
