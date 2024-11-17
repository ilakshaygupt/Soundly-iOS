//
//  MainView.swift
//  Soundly
//
//  Created by Lakshay Gupta on 07/06/24.
//
import Foundation
import SwiftUI
import AVKit
import Combine



struct MainView: View {
    @EnvironmentObject var tabViewModel: TabViewModel
    @EnvironmentObject var playerControls: PlayerControlsLogic
    @EnvironmentObject var navigationState: NavigationState

    var body: some View {
        HomePageScreen()
            .withTabBar()
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Text("Hey, Lakshay")
                            .font(.system(size: 28))
                        Spacer()
                        Image("Honey Singh")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                    }
                    .padding(.bottom, 3)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
    }
}



struct GameView: View {
    @EnvironmentObject var navigationstate : NavigationState
    var body: some View {

            VStack {

                Button(
                    action:{
                        navigationstate.routes.append(.detail)
                    }
                    )
                    {
                        Text("GO TO DETAIL VIEW")
                    }

            }

//        .withTabBar()
    }
}

struct DetailView: View {
    var body: some View {
        VStack {
            Text("Detail View")

        }
        .withTabBar()
    }
}


#Preview {
    MainView()
        .environmentObject(TabViewModel())
        .environmentObject(PlayerControlsLogic.shared)
}
