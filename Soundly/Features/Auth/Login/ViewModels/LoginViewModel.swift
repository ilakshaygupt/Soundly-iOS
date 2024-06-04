//
//  LoginViewModel.swift
//  Soundly
//
//  Created by Lakshay Gupta on 04/06/24.
//
import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var username: String = ""
    @Published var otp: String = ""
    @Published var isLoading: Bool = false
    @Published var error: APIError?
    @Published var isOTPRequested: Bool = false
    
    func login() {
        self.isLoading = true
        LoginAction(parameters: LoginRequest(username: username)).call { response in
            self.error = nil
            self.isOTPRequested = true
            self.isLoading = false
        } failure: { error in
            self.error = error
            self.isLoading = false
        }
    }
    
    func verifyOTP() {
        self.isLoading = true
        OTPVerificationAction(parameters: OTPVerificationRequest(username: username, otp: otp)).call { response in
            self.error = nil
            Auth.shared.setCredentials(
                access: response.data.access_token,
                refresh: response.data.refresh_token
            )
            self.isLoading = false
        } failure: { error in
            self.error = error
            self.isLoading = false
        }
    }
}
