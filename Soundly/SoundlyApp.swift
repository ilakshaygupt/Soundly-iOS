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

    @Namespace var animation

    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $navigationState.routes) {
                if isOnboardingComplete {
                    ContentContainer(
                        content: HomePageScreen(),
                        currentTabIndex: 0
                    )
                        .environmentObject(playerControls)
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
            .transition(.blurReplace())
            .environmentObject(navigationState)
//            .environmentObject(tabViewModel)
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
            case .home:
                ContentContainer(
                    content: HomePageScreen(),
                    currentTabIndex: 0
                )
                .environmentObject(playerControls)
                .navigationBarBackButtonHidden()
//                .matchedGeometryEffect(id: "animation", in: animation)
                .swipeBackGesture()

            case .library:
                ContentContainer(
                    content: LibraryScreen(),
                    currentTabIndex: 1
                )
                .environmentObject(playerControls)
                .navigationBarBackButtonHidden()
//                .matchedGeometryEffect(id: "animation", in: animation)
                .swipeBackGesture()
                

            case .search:
                ContentContainer(
                    content: SearchScreen(),
                    currentTabIndex: 2
                )
                .environmentObject(playerControls)
                .navigationBarBackButtonHidden()
                .swipeBackGesture()
//                .matchedGeometryEffect(id: "animation", in: animation)
            case .game:
                ContentContainer(
                    content: GameView(),
                    currentTabIndex: 3
                )
                .environmentObject(playerControls)
                .navigationBarBackButtonHidden()
                .swipeBackGesture()
//                .matchedGeometryEffect(id: "animation", in: animation)
            case .detail:
                ContentContainer(
                    content: DetailView(),
                    currentTabIndex: 3
                )
                .environmentObject(playerControls)
                .navigationBarBackButtonHidden()
                .swipeBackGesture()
//                .matchedGeometryEffect(id: "animation", in: animation)
            case .songSheetView:
                SongSheetView()
                    .environmentObject(playerControls)
        }

    }

}
