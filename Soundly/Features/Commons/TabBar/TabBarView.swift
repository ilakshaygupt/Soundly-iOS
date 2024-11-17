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
    let index: Int
    let route: Route
}

struct CustomTabBar: View {
    @EnvironmentObject var tabViewModel: TabViewModel
    @EnvironmentObject var navigationState :NavigationState

    private let tabs = [
        TabItem(image: "house.fill", text: "Home", index: 0, route: .home),
        TabItem(image: "books.vertical.fill", text: "Library", index: 1, route: .library),
        TabItem(image: "magnifyingglass", text: "Search", index: 2, route: .search),
        TabItem(image: "gamecontroller.fill", text: "Game", index: 3, route: .game)

    ]

    var body: some View {
        HStack(spacing: 0) {
            ForEach(tabs, id: \.index) { tab in
                TabBarButton(
                    image: tab.image,
                    text: tab.text,
                    isSelected: tabViewModel.activeTabIndex == tab.index
                ) {
                    withAnimation {
                        tabViewModel.activeTabIndex = tab.index
                        navigationState.routes.append(tab.route)

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
    @EnvironmentObject var tabViewModel: TabViewModel
    var content: Content

    var body: some View {
        HStack(alignment: .bottom) {
            content
            VStack(spacing: 0) {
                NowPlayingBar()
                    .background(Color.white)
            }
            .withTabBar()
        }

    }
}




class TabViewModel: ObservableObject {
    @Published var activeTabIndex: Int = 0
}

struct TabBarModifier: ViewModifier {
    @EnvironmentObject var playerControls: PlayerControlsLogic

    func body(content: Content) -> some View {
        VStack(alignment: .trailing) {
            content

            VStack(spacing: 0) {
                NavigationLink(destination: CurrentSongView()) {
                    NowPlayingBar()
                        .background(Color.white)
                        .shadow(radius: 2)
                }
                .buttonStyle(PlainButtonStyle())

                CustomTabBar()
            }
        }
    }
}



extension View {
    func withTabBar() -> some View {
        self.modifier(TabBarModifier())
    }
}
