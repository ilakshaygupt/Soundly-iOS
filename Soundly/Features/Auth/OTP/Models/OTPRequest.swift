//
//  OTPRequest.swift
//  Soundly
//
//  Created by Lakshay Gupta on 04/06/24.
//

import Foundation

struct OTPRequest: Encodable {
    let username: String
    let otp: String
}
