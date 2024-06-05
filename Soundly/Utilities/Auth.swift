//
//  Auth.swift
//  Soundly
//
//  Created by Lakshay Gupta on 04/06/24.
//

import Foundation
import SwiftKeychainWrapper

class Auth: ObservableObject {
    
    struct Credentials {
        var access: String?
        var refresh: String?
    }
    
    struct SignupDetails {
        var email: String?
        var username: String?
        var phoneNumber : String?
    }
    
    enum KeychainKey: String {
        case access
        case refresh
        case email
        case username
        case phoneNumber
    }
    
    static let shared: Auth = Auth()
    private let keychain: KeychainWrapper = KeychainWrapper.standard
    
    @Published var loggedIn: Bool = false
    
    private init() {
        loggedIn = hasAccessToken()
    }
    
    func getCredentials() -> Credentials {
        return Credentials(
            access: keychain.string(forKey: KeychainKey.access.rawValue),
            refresh: keychain.string(forKey: KeychainKey.refresh.rawValue)
        )
    }
    
    func setCredentials(access: String, refresh: String) {
        keychain.set(access, forKey: KeychainKey.access.rawValue)
        keychain.set(refresh, forKey: KeychainKey.refresh.rawValue)
        
        loggedIn = true
    }
    
    func hasAccessToken() -> Bool {
        return getCredentials().access != nil
    }
    
    func getAccessToken() -> String? {
        return getCredentials().access
    }
    
    func getRefreshToken() -> String? {
        return getCredentials().refresh
    }
    
    func logout() {
        KeychainWrapper.standard.removeObject(forKey: KeychainKey.access.rawValue)
        KeychainWrapper.standard.removeObject(forKey: KeychainKey.refresh.rawValue)
        
        loggedIn = false
    }
    
    func setSignUpEmail(email: String){
        keychain.set(email, forKey: KeychainKey.email.rawValue)
        
    }
    func setSignUpUsername(username: String){
        keychain.set(username, forKey: KeychainKey.username.rawValue)
        keychain.string(forKey: KeychainKey.username.rawValue)
    }
    func setSignUpPhoneNumber(phoneNumber: String){
        keychain.set(phoneNumber, forKey: KeychainKey.phoneNumber.rawValue)
    }
    
    func getSignUpEmail() -> SignupDetails{
        return SignupDetails(
            
            email: keychain.string(forKey: KeychainKey.email.rawValue),
            username: keychain.string(forKey: KeychainKey.username.rawValue),
            phoneNumber: keychain.string(forKey: KeychainKey.phoneNumber.rawValue)
        )
    }
}
