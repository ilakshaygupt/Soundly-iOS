//
//  OTPResponse.swift
//  Soundly
//
//  Created by Lakshay Gupta on 04/06/24.
//

import Foundation

struct OTPResponse: Decodable {
    let success: Bool
    let message: String
    let data: OTPData?
}

struct OTPData: Decodable {
    let access_token: String
    let refresh_token: String
}
