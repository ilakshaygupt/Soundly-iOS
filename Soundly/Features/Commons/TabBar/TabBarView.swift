//
//  TabBaView.swift
//  Soundly
//
//  Created by Lakshay Gupta on 08/11/24.
//

import SwiftUI

struct TabItem {
    let image: String
    let text: String
    let route: Route
    let index: Int
}

struct CustomTabBar: View {
    @EnvironmentObject var navigationState: NavigationState

    private let tabs = [
        TabItem(image: "house.fill", text: "Home", route: .home,index: 0),
        TabItem(image: "books.vertical.fill", text: "Library", route: .library,index: 1),
        TabItem(image: "magnifyingglass", text: "Search", route: .search,index: 2),
        TabItem(image: "gamecontroller.fill", text: "Game", route: .game,index: 3)
    ]

    /// The current selected index
    let currentTabIndex: Int
    let onTabSelected: (Int) -> Void

    var body: some View {
        HStack(spacing: 0) {
            ForEach(tabs.indices, id: \.self) { index in
                let tab = tabs[index]
                TabBarButton(
                    image: tab.image,
                    text: tab.text,
                    isSelected: index == currentTabIndex
                ) {
                    withAnimation {
                        onTabSelected(index)
//                        navigationState.routes.append(tab.route)
                    }
                }
            }
        }
        .padding(.top, 10)
        .padding(.bottom, 5)
        .background(Color(red: 213/255, green: 234/255, blue: 234/255))
    }
}

struct TabBarButton: View {
    let image: String
    let text: String
    let isSelected: Bool
    let action: () -> Void

    private let activeColor = Color(red: 0/255, green: 139/255, blue: 139/255)
    private let inactiveColor = Color.gray

    var body: some View {
        Button(action: action) {
            VStack(spacing: 4) {
                Image(systemName: image)
                    .font(.system(size: 20))
                    .foregroundColor(isSelected ? activeColor : inactiveColor)

                Text(text)
                    .font(.system(size: 12))
                    .foregroundColor(isSelected ? activeColor : inactiveColor)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

struct ContentContainer<Content: View>: View {
    @EnvironmentObject var navigationState: NavigationState
    var content: Content
    let currentTabIndex: Int


    var body: some View {
        VStack() {
            content
//            VStack(spacing: 0) {
//                NowPlayingBar()
//                    .background(Color.white)
//            }
            .withTabBar(
                currentTabIndex: currentTabIndex,
                onTabSelected: { newIndex in
                    handleTabSelection(newIndex)
                }
            )
        }
    }

    private func handleTabSelection(_ newIndex: Int) {

        switch newIndex {
            case 0:
                navigationState.routes.append( .home)
            case 1:
                navigationState.routes.append( .library)
            case 2:
                navigationState.routes.append( .search)
            case 3:
                navigationState.routes.append( .game)
            default:
                break
        }
    }
}



struct TabBarModifier: ViewModifier {
    @EnvironmentObject var playerControls: PlayerControlsLogic
    @EnvironmentObject var navigationState : NavigationState
    let currentTabIndex: Int
    let onTabSelected: (Int) -> Void
    func body(content: Content) -> some View {
        VStack(alignment: .trailing) {
            content

            Button(action:
                    {
                navigationState.routes.append(.songSheetView)
            }
            )
            {  
                NowPlayingBar()
                    .background(Color.white)
                    .shadow(radius: 2)
            }
            .buttonStyle(PlainButtonStyle())

            CustomTabBar(
                currentTabIndex: currentTabIndex,
                onTabSelected: onTabSelected
            )
        }
    }
}




extension View {
    func withTabBar(currentTabIndex: Int, onTabSelected: @escaping (Int) -> Void) -> some View {
        self.modifier(TabBarModifier(currentTabIndex: currentTabIndex, onTabSelected: onTabSelected))
    }
}
