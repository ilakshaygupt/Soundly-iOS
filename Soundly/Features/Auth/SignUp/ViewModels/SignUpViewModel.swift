//
//  SignUpViewModel.swift
//  Soundly
//
//  Created by Lakshay Gupta on 04/06/24.
//

import Foundation

class SignupViewModel: ObservableObject {
    
    @Published var username: String = ""
    @Published var email: String = ""
    @Published var success = false
    @Published var isLoading = false
    @Published var errorMessage = ""
    @Published var isErrorToast: Bool = false
    @Published var error: APIError?
    
    func SignUp() {
        SignupAction(
            parameters: SignupRequest(
                email: email, username: username
            )
        ).call { response in
            self.error = nil
            DispatchQueue.main.async {
                if response.success {
                    self.success.toggle()
                    self.isLoading.toggle()
                }
            }
        } failure: { error in
            self.error = error
            DispatchQueue.main.async {
                self.isLoading.toggle()
            }
        }
    }
}
