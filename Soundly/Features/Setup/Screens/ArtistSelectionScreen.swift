//
//  ArtistSelectionScreen.swift
//  Soundly
//
//  Created by Lakshay Gupta on 31/05/24.
//

import SwiftUI

struct ArtistSelectionScreen: View {
    
    let layout  = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    @State private var selectedArtists :Set<ArtistSelectionModel> = []
    var body: some View {
        NavigationStack{
            VStack{
                
                HStack{
                    Text("Which artist you love to listen?")
                        .font(.largeTitle)
                        .padding()
                    Spacer()
                }
                LazyVGrid(columns:layout){
                    ForEach(ArtistSelectionData.artistData,id : \.self){artist in
                        Button(action: {
                            if self.selectedArtists.contains(artist) {
                                self.selectedArtists.remove(artist)
                            } else {
                                self.selectedArtists.insert(artist)
                            }
                            
                        }) {
                            VStack{
                                
                                Image(artist.name)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width:140,height: 140)
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(Circle())
                                    .overlay(
                                        Circle().stroke(self.selectedArtists.contains(artist) ? Color.teal : Color.clear, lineWidth: 8)
                                    )
                                Text(artist.name)
                                    .font(.system(size: 20))
                                    .foregroundColor(.black)
                                    .bold(self.selectedArtists.contains(artist) ? true : false)
                                    .fontWeight(self.selectedArtists.contains(artist) ? .heavy : .regular)
                            }
                        }
                    }
                }
                
                Spacer()
                HStack{
                    Spacer()
                    NavigationLink(destination: HomePageScreen()){
                        Text("Next")
                            .foregroundColor(Color(red: 0.0, green: 0.545, blue: 0.545))
                            .bold()
                    }
                    
                }.padding()
                
                
            }
        }
    }
}

#Preview {
    ArtistSelectionScreen()
}
