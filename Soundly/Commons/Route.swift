//
//  Route.swift
//  Soundly
//
//  Created by Lakshay Gupta on 08/11/24.
//

import SwiftUI


struct OTPScreenDefault: Hashable {
    let username : String
    let isPhoneNumber : Bool
    let contactInfo : String
}

enum Route: Hashable{
    case getStartedScreen
    case loginScreen
    case signUpScreen
    case oTPScreen(OTPScreenDefault)
    case forgotUsername
    case languageSelectionScreen
    case artistSelectionScreen
    case home
    case library
    case search
    case game
    case detail
    case songSheetView

}

class NavigationState: ObservableObject {

    @Published var routes: [Route] = []

    func popTo(_ route: Route) {
        guard let index = routes.firstIndex(of: route) else { return }
        routes = Array(routes[0...index])
    }

    func popToRoot() {
        withAnimation {

            routes.removeLast(routes.count)
        }
    }
    func pushAsRoot(_ route: Route) {
        withAnimation {

            routes.removeAll()
            routes.append(route)
        }

    }
    func replace(with route: Route) {
        withAnimation {

            if !routes.isEmpty {
                routes.removeLast()
            }
            routes.append(route) // Add the new route
        }
    }


}
