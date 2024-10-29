//
//  NavigationManager.swift
//  Soundly
//
//  Created by Lakshay Gupta on 23/10/24.
//

import Foundation

import SwiftUI
import SwiftUI

class NavigationManager: ObservableObject {
    // Singleton instance
    static let shared = NavigationManager()

    // Published path to track navigation stack
    @Published var path = NavigationPath()

    private init() {}  // Private initializer to prevent creating new instances

    // Push a new view onto the stack
    func push<T: Hashable>(_ view: T) {
        path.append(view)
    }

    // Push a new view, replacing the current top view
    func pushReplacement<T: Hashable>(_ view: T) {
        if !path.isEmpty {
            path.removeLast()
        }
        path.append(view)
    }

    // Pop the current view from the stack
    func pop() {
        if !path.isEmpty {
            path.removeLast()
        }
    }

    // Pop to the root view
    func popToRoot() {
        path.removeLast(path.count)
    }
}
