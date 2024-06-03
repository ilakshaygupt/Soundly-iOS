//
//  SliderView.swift
//  Soundly
//
//  Created by Lakshay Gupta on 03/06/24.
//

import SwiftUI

struct SliderView: View {
    var body: some View {
        TabView {
            ForEach(SliderAlbumsData.albumsData, id: \.self) { page in
                ZStack {
                    page.linearGradaient
                        .edgesIgnoringSafeArea(.all)
                    HStack{
                        Spacer()
                        Image(page.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: getScreenBounds().width * 0.33)
                            .edgesIgnoringSafeArea(.all)}
                    HStack{
                        VStack (alignment:.leading){
                            Text(page.name)
                                .bold()
                                .font(.title)
                                .fontWeight(.heavy)
                                .font(.system(size: 26))
                                
                                
                            Text("By Soundly").font(.system(size: 16))
                                
                                
                            
                            
                                
                                Text("Listen Now")
                                    .font(.system(size: 20))
                                    .bold()
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(page.buttonColors)
                                    .cornerRadius(10)
                                    .padding()
                            
                        }.padding()
                        
                        Spacer()}
                    
                }
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}


#Preview {
    SliderView()
}


struct SliderAlbums :Hashable,  Equatable{
    let name : String
    let imageName : String
    let linearGradaient : LinearGradient
    let buttonColors : Color
    static func == (lhs: SliderAlbums, rhs: SliderAlbums) -> Bool {
         return lhs.name == rhs.name &&
                lhs.imageName == rhs.imageName
     }
     
     func hash(into hasher: inout Hasher) {
         hasher.combine(name)
         hasher.combine(imageName)
     }
     

    
}

struct SliderAlbumsData{
    static let albumsData = [
        SliderAlbums(name: "The Havanna", imageName: "SliderAlbum1",linearGradaient:  LinearGradient(
            gradient: Gradient(stops: [
                .init(color: Color(red: 255/255, green: 248/255, blue: 243/255).opacity(0.97), location: 0),
                .init(color: Color(red: 231/255, green: 255/255, blue: 255/255).opacity(0.97), location: 0.01),
                .init(color: Color(red: 110/255, green: 183/255, blue: 183/255), location: 1.37)
            ]),
            startPoint: .top,
            endPoint: .bottom
        ),
                     buttonColors: Color(red: 0/255, green: 86/255, blue: 86/255, opacity: 1)
        )
    
        ,
        SliderAlbums(name: "The Solitude", imageName: "SliderAlbum2",linearGradaient:  LinearGradient(
            gradient: Gradient(stops: [
                .init(color: Color(red: 243/255, green: 244/255, blue: 255/255).opacity(0.97), location: 0),
                .init(color: Color(red: 154/255, green: 158/255, blue: 243/255), location: 1)
            ]),
            startPoint: .top,
            endPoint: .bottom
        ),
                     buttonColors: Color(red: 78/255, green: 108/255, blue: 185/255, opacity: 1)
        ),
        SliderAlbums(name: "The Wanderlust", imageName: "SliderAlbum3",linearGradaient:     LinearGradient(
            gradient: Gradient(stops: [
                .init(color: Color(red: 255/255, green: 255/255, blue: 243/255, opacity: 0.97), location: 0.0),
                .init(color: Color(red: 220/255, green: 174/255, blue: 39/255), location: 1.3712)            ]),
            startPoint: .top,
            endPoint: .bottom
        ),
                     buttonColors: Color(red: 143/255, green: 134/255, blue: 53/255, opacity: 1)
        ),
    ]
}
