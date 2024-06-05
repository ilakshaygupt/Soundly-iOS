//
//  ForgotUsernameRequest.swift
//  Soundly
//
//  Created by Lakshay Gupta on 05/06/24.
//

import Foundation


struct ForgotUsernameEmailRequest :Encodable{
    let email : String
}


struct ForgotUsernamePhoneRequest :Encodable{
    let phone_number : String
}
