//
//  GetStartedScreen.swift
//  Soundly
//
//  Created by Lakshay Gupta on 24/05/24.
//

import SwiftUI
struct GetStartedScreen: View {
    var body: some View {
        NavigationStack {
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
                        .frame(width: geometry.size.width * 0.90, height: geometry.size.height * 0.66)
                    
                    Spacer()
                    
                    NavigationLink(destination: LoginScreen()) {
                        Text("Get Started →")
                            .frame(width: geometry.size.width * 0.70)
                            .font(.system(size: 20))
                            .bold()
                            .foregroundColor(.white)
                            .padding()
                            .background(Color(red: 0.0, green: 0.545, blue: 0.545))
                            .cornerRadius(10)
                    }
                    .padding(.bottom , 40)
                    
                }
            }
        }
    }
}

#Preview {
    GetStartedScreen()
}
