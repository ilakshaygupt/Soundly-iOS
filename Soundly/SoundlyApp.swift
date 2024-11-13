//
//  SoundlyApp.swift
//  Soundly
//
//  Created by Lakshay Gupta on 24/05/24.
//

import SwiftUI


@main
struct SoundlyApp: App {
    @StateObject private var navigationState = NavigationState()


    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $navigationState.routes)
            {
                GetStartedScreen()
                    .navigationDestination(for: Route.self) { route in
                        switch route {
                            case .getStartedScreen:
                                GetStartedScreen()
                            case .loginScreen:
                                LoginScreen()
                            case .signUpScreen:
                                SignUpScreen()
                            case .oTPScreen(let otpScreenData):
                                OTPScreen(username: otpScreenData.username,
                                          isPhoneNumber: otpScreenData.isPhoneNumber,
                                          contactInfo: otpScreenData.contactInfo)
                            case .forgotUsername:
                                ForgotUsername()
                        }
                    }
            }
            .environmentObject(navigationState)
        }
    }
}


