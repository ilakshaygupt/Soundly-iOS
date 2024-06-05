//
//  SignUpRequest.swift
//  Soundly
//
//  Created by Lakshay Gupta on 04/06/24.
//

import Foundation


struct SignupEmailRequest: Encodable {
    let email: String
    let username: String
}

struct SignupPhoneRequest: Encodable {
    let phone_number: String
    let username: String
}
