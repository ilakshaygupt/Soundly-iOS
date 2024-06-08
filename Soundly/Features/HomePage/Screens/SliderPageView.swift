//
//  SliderPageView.swift
//  Soundly
//
//  Created by Lakshay Gupta on 06/06/24.
//

import SwiftUI


struct SliderPageView: View {
    let page: SliderAlbums
    
    var body: some View {
        ZStack {
            page.linearGradaient
                .edgesIgnoringSafeArea(.all)
            HStack {
                Spacer()
                Image(page.imageName)
                    .resizable()
                   .scaledToFill()
                   .frame(width: getScreenBounds().width * 0.23)
            }
            HStack {
                VStack(alignment: .leading) {
                    Text(page.name)
                        .bold()
                        .font(.title)
                        .fontWeight(.heavy)
                        .font(.title2)
                    Text("By Soundly")
                        .font(.title3)
                    Text("Listen Now")
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                        .background(page.buttonColors)
                        .cornerRadius(10)
                        .padding(.top, 16)
                    
                    Spacer()
                }
                .padding()
                
                Spacer()
            }
            .padding()
        }
        .clipShape(RoundedRectangle(cornerRadius: 25.0)).padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
    }
}

#Preview {
    SliderPageView(page:SliderAlbums.albumsData[0])
}
