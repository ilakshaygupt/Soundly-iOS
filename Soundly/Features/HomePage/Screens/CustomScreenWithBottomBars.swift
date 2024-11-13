//
//  CustomScreenWithBottomBars.swift
//  Soundly
//
//  Created by Lakshay Gupta on 08/11/24.
//

// First, let's create a custom TabBar view
import SwiftUI


struct CustomTabBar: View {
    @Binding var selectedTab: Int

    var body: some View {
        HStack(spacing: 0) {
            TabBarButton(image: "house.fill", text: "Home", isSelected: selectedTab == 0) {
                selectedTab = 0
            }
            TabBarButton(image: "books.vertical.fill", text: "Library", isSelected: selectedTab == 1) {
                selectedTab = 1
            }
            TabBarButton(image: "magnifyingglass", text: "Search", isSelected: selectedTab == 2) {
                selectedTab = 2
            }
            TabBarButton(image: "gamecontroller.fill", text: "Game", isSelected: selectedTab == 3) {
                selectedTab = 3
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

    var body: some View {
        Button(action: action) {
            VStack(spacing: 4) {
                Image(systemName: image)
                    .foregroundColor(isSelected ? Color(red: 0/255, green: 139/255, blue: 139/255) : .gray)
                Text(text)
                    .font(.system(size: 12))
                    .foregroundColor(isSelected ? Color(red: 0/255, green: 139/255, blue: 139/255) : .gray)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

// Updated Container View
struct ContentContainer<Content: View>: View {
//    @StateObject private var viewModel = MainViewModel.shared
    var content: Content

    var body: some View {
        ZStack(alignment: .bottom) {
            content
            VStack(spacing: 0) {
                NowPlayingBar()
                    .background(Color.white)
//                    .zIndex(1)
//                CustomTabBar(selectedTab: $viewModel.selectedTab)
//                    .zIndex(0)
            }
        }
    }
}



