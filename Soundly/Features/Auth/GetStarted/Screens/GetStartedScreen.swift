//
//  GetStartedScreen.swift
//  Soundly
//
//  Created by Lakshay Gupta on 24/05/24.
//

import SwiftUI
struct GetStartedScreen: View {

    @State var isGetStartedClicked : Bool = false

    @EnvironmentObject private var navigationState: NavigationState

    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    Text("Your Thoughts")
                        .font(.system(size: 30))
                    Text("Cleaner")
                        .foregroundColor(Color(red: 0.0, green: 0.545, blue: 0.545))
                        .font(.system(size: 30))
                        .bold()
                }
                .padding(.top, 40)
                .frame(maxWidth: .infinity, alignment: .center)

                Text("Let the music take control!")
                    .font(.system(size: 20))
                    .padding(.top, 16)
                    .frame(maxWidth: .infinity, alignment: .center)

                Image("Yoga")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: getScreenBounds().width  * 0.90, height: getScreenBounds().height  * 0.66)
                Spacer()
                HStack(spacing: 20) {
                    Button(
                        action:{
                            withAnimation{
//                                navigationState.replace(with: .signUpScreen)
                                navigationState.routes.append(.signUpScreen)
                            }
                        }
                    ){
                        Text("Get Started →")
                            .frame(width: getScreenBounds().width * 0.35) // Updated width for two buttons
                            .font(.system(size: 20))
                            .bold()
                            .foregroundColor(.white)
                            .padding()
                            .background(Color(red: 0.0, green: 0.545, blue: 0.545))
                            .cornerRadius(10)
                    }
                    Button(
                        action:{
                            withAnimation{
                                navigationState.routes.append(.loginScreen)
                            }
                        }
                    ){
                        Text("Welcome Back")
                            .frame(width: getScreenBounds().width * 0.35) // Mirrored width
                            .font(.system(size: 20))
                            .bold()
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.gray) // Different color for variety
                            .cornerRadius(10)
                    }
                }
                .padding(.bottom , 50)
            }
        }
    }
}

#Preview {
    GetStartedScreen()
}
