//
//  HomePageScreen.swift
//  Soundly
//
//  Created by Lakshay Gupta on 03/06/24.
//

import SwiftUI

struct HomePageScreen: View {
    var body: some View {
        NavigationStack {
            VStack {
                SliderView()
                    .frame(height: 300)
                    .cornerRadius(40)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    .padding()
                Spacer()
            }
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            HStack {
                                Text("Hey , Lakshay")
                                    .font(.system(size: 28))
                                Spacer()
                                Image("Honey Singh")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(Circle())
                            }
                        }
                    }
        }
    }
}

#Preview {
    HomePageScreen()
}
