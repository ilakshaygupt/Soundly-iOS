//
//  ForgotUsernameViewModel.swift
//  Soundly
//
//  Created by Lakshay Gupta on 05/06/24.
//

import Foundation
class ForgotUsernameEmailViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var success = false
    @Published var isLoading = false
    @Published var errorMessage = ""
    @Published var isErrorToast: Bool = false
    @Published var error: APIError?

    func forgotUsernameEmail() {
        self.isErrorToast=false
        self.isLoading = true
        ForgotUsernameEmailAction(
            parameters: ForgotUsernameEmailRequest(
                email: email
            )
        ).call { response in
                if response.success {
                    Auth.shared.setSignUpEmail(email: self.email)
                    Auth.shared.setSignUpUsername(username: response.data ?? "")
                    
                    self.isLoading=false
                    self.success=true
                    
                } else {
                    
                    self.errorMessage = response.message
                    self.isLoading=false
                }
                
            
        } failure: { error in
            self.error = error
            
                self.errorMessage = error.localizedDescription
                self.isLoading = false
            
        }
    }
}

class ForgotUsernamePhoneViewModel: ObservableObject {
    @Published var phone_number: String = ""
    @Published var success = false
    @Published var isLoading = false
    @Published var errorMessage = ""
    @Published var isErrorToast: Bool = false
    @Published var error: APIError?

    func forgotUsernamePhone() {
        self.isLoading = true
        ForgotUsernamePhoneAction(
            parameters: ForgotUsernamePhoneRequest(
                phone_number: phone_number
            )
        ).call { response in
            self.error = nil
            
                if response.success {
                    Auth.shared.setSignUpPhoneNumber(phoneNumber: self.phone_number)
                    Auth.shared.setSignUpUsername(username: response.data ?? "")
                    self.success = true
                } else {
                    self.errorMessage = response.message
                }
                self.isLoading = false
            
        } failure: { error in
            self.error = error
            
                self.errorMessage = error.localizedDescription
                self.isLoading = false
            
        }
    }
}
