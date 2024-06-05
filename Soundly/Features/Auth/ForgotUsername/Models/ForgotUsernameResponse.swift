//
//  ForgotUsernameResponse.swift
//  Soundly
//
//  Created by Lakshay Gupta on 05/06/24.
//

import Foundation


struct ForgotUsernameEmailResponse : Decodable{
    let success: Bool
    let message: String
    let data : String?
}



struct ForgotUsernamePhoneResponse : Decodable{
    let success: Bool
    let message: String
    let data : String?
}
