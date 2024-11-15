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
    case mainView

}

class NavigationState: ObservableObject {

    @Published var routes: [Route] = []

    func popTo(_ route: Route) {
        guard let index = routes.firstIndex(of: route) else { return }
        routes = Array(routes[0...index])
    }

    func popToRoot() {
        routes.removeLast(routes.count)
    }
    func pushAsRoot(_ route: Route) {
        routes.removeAll()
        routes.append(route)



    }
    func replace(with route: Route) {
        if !routes.isEmpty {
            routes.removeLast()
        }
        routes.append(route) // Add the new route
    }


}
