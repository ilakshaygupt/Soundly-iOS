//
//  OTPViewModel.swift
//  Soundly
//
//  Created by Lakshay Gupta on 04/06/24.
//

import Foundation

import Foundation

class OTPViewModel: ObservableObject {
    
    @Published var otp: String = ""
    
    @Published var success = false
    @Published var isLoading = false
    @Published var errorMessage = ""
    @Published var isErrorToast: Bool = false
    @Published var error: APIError?
    
    func verifyOtp() {
        self.error = nil
        self.isLoading = true
        self.isErrorToast = false
        self.errorMessage = ""
        print("--------------------------------------")
        print(Auth.shared.getSignUpEmail().username ?? " ")
        print(otp)
        OTPAction(
            parameters: OTPRequest(
                username:Auth.shared.getSignUpEmail().username ?? " ", otp: otp
            )
        ).call { response in

            DispatchQueue.main.async {
                if response.success {
                    Auth.shared.setCredentials(
                    access: response.data?.access_token ?? "",
                       refresh: response.data?.refresh_token ?? ""
                   )
                    
                    self.isLoading = false
                    self.success = true
                } else {
                    self.success = false
                    self.errorMessage = response.message
                    self.isErrorToast = true
                    self.isLoading = false
                }
            }
        } failure: { error in
            self.error = error
            self.isLoading = false
        }
    }
}
