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
    @Published var success: Bool = false
    @Published var isErrorToast: Bool = false
    @Published var errorMessage = ""
    
    func login() {
        
        self.error = nil
        self.isErrorToast = false
        self.errorMessage = ""
        self.isLoading = true
        LoginAction(parameters: LoginRequest(username: username)).call { response in
            DispatchQueue.main.async {
                if response.success {
                    Auth.shared.setSignUpUsername(username: self.username)
                    self.isOTPRequested = true
                    self.success = true
                    self.isLoading = false
                    self.success = true
                    self.isLoading = false
                } else {
        
                    self.success = false
                    self.errorMessage = response.message
                    self.isErrorToast = true
                    self.isLoading = false
                }
            }
        } failure: { error in
            DispatchQueue.main.async {
                // Handle API call failure
                self.error = error
                self.isLoading = false
            }
        }
    }
}
