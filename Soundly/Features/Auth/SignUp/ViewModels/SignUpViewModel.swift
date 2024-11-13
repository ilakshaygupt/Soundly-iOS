//
//  SignUpViewModel.swift
//  Soundly
//
//  Created by Lakshay Gupta on 04/06/24.
//

import Foundation
import SwiftUICore

class SignupEmailViewModel: ObservableObject {
    
    @Published var username: String = ""
    @Published var email: String = ""
    @Published var success = false
    @Published var isLoading = false
    @Published var errorMessage = ""
    @Published var isErrorToast: Bool = false
    @Published var error: APIError?
    @EnvironmentObject private var navigationState: NavigationState


    func SignUp() {
        self.error = nil
        self.isErrorToast = false
        self.errorMessage = ""
        self.isLoading = true

        SignupEmailAction(
            parameters: SignupEmailRequest(
                email: email, username: username
            )
        ).call { response in
//            self.error = nil
            DispatchQueue.main.async {
                if response.success {
                    Auth.shared.setSignUpUsername(username: self.username)
                    Auth.shared.setSignUpEmail(email: self.email)
                    self.success = true
                    self.isLoading = false
                    self.success = true
                    self.isLoading = false

                }
                else{
                    self.success = false
                    self.errorMessage = response.message
                    self.isErrorToast = true
                    self.isLoading = false
                }
            }
        } failure: { error in
            self.error = error
            DispatchQueue.main.async {
                self.isLoading = false
                self.error = error
            }
        }
    }
}


class SignupPhoneViewModel: ObservableObject {
    
    @Published var username: String = ""
    @Published var phone_number: String = ""
    @Published var success = false
    @Published var isLoading = false
    @Published var errorMessage = ""
    @Published var isErrorToast: Bool = false
    @Published var error: APIError?
    @EnvironmentObject private var navigationState: NavigationState
    func SignUp() {
        self.error = nil
        self.isErrorToast = false
        self.errorMessage = ""
        self.isLoading = true

        SignupPhoneAction(
            parameters: SignupPhoneRequest(
                phone_number: phone_number, username: username
            )
        ).call { response in
//            self.error = nil
            DispatchQueue.main.async {
                if response.success {
                    Auth.shared.setSignUpUsername(username: self.username)
                    Auth.shared.setSignUpPhoneNumber(phoneNumber: self.phone_number)
                    self.success = true
                    self.isLoading = false
                    self.success = true
                    self.isLoading = false
                } else{
                    self.success = false
                    self.errorMessage = response.message
                    self.isErrorToast = true
                    self.isLoading = false
                }
            }
        } failure: { error in
            self.error = error
            DispatchQueue.main.async {
                self.isLoading = false
                self.error = error
            }
        }
    }
}
