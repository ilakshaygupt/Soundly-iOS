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
    @AppStorage("isOnboardingComplete") private var isOnboardingComplete = false
    @StateObject private var playerControls = PlayerControlsLogic.shared
    @StateObject private var tabViewModel = TabViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $navigationState.routes) {
                if isOnboardingComplete {
                    MainView()
                        .environmentObject(playerControls)
                        .environmentObject(tabViewModel)
                        .navigationDestination(for: Route.self) { route in
                            navigationDestination(for: route)
                        }
                } else {
                    GetStartedScreen()
                        .onDisappear {

                            isOnboardingComplete = true
                        }
                        .navigationDestination(for: Route.self) { route in
                            navigationDestination(for: route)
                        }
                }
            }
            .environmentObject(navigationState)
            .environmentObject(tabViewModel)
        }
    }

    @ViewBuilder
    private func navigationDestination(for route: Route) -> some View {
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
            case .languageSelectionScreen:
                LanguageSelectionScreen()
            case .artistSelectionScreen:
                ArtistSelectionScreen()
            case .mainView:
                MainView()
                    .environmentObject(playerControls)
                    .environmentObject(tabViewModel)
            case .home:
                HomePageScreen()
                    .withTabBar()
                    .navigationBarBackButtonHidden()
            case .library:
                LibraryScreen()
                    .withTabBar()
                    .navigationBarBackButtonHidden()
            case .search:
                SearchScreen()
                    .withTabBar()
                    .navigationBarBackButtonHidden()
            case .game:
                GameView()
                    .withTabBar()
                    .navigationBarBackButtonHidden()
            case .detail:
                DetailView()
        }
    }
}
