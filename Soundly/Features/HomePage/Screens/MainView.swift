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
                Spacer()
            }

//        .withTabBar()
    }
}

struct DetailView: View {
    var body: some View {
        VStack {
            Text("Detail View")
            Spacer()

        }
//        .withTabBar()
    }
}


//#Preview {
//    MainView()
//        .environmentObject(TabViewModel())
//        .environmentObject(PlayerControlsLogic.shared)
//}
