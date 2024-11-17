//
//  HomePageScreen.swift
//  Soundly
//
//  Created by Lakshay Gupta on 03/06/24.
//

import SwiftUI
import AVKit
struct HomePageScreen: View {

    var body: some View {
//        NavigationStack {
            ScrollView {
                VStack {
                    SliderView()
                        .frame(height: getScreenBounds().width * 0.9)
                        .cornerRadius(40)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                    HorizontalSongsView()

                    Spacer()
                }
                .padding(5)
                
            }

        .padding(EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0))
//        .withTabBar()
    }
    
}


#Preview {
    HomePageScreen()
}
