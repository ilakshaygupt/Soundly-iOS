//
//  HorizontalSongView.swift
//  Soundly
//
//  Created by Lakshay Gupta on 04/06/24.
//
import SwiftUI
import NetworkImage // Import URLImage library

struct HorizontalSongView: View {
    @State private var publicSongs: [Song] = []
    
    var body: some View {
        VStack {
            HStack {
                Text("FOR YOU")
                    .font(.system(size: 26))
                    .bold()
                Spacer()
            }
            .padding()
            
            ScrollView(.horizontal) {
                ScrollViewReader { value in
                    LazyHStack {
                        ForEach(publicSongs, id: \.id) { song in
                            
                            VStack {
                                
                                NetworkImage(imageUrl: URL(string: song.thumbnail_url)!)

                                .frame(width: 180, height: 180)
                                .border(Color.black)
                                .padding()
                                
                                Text(song.name)
                                    .font(.headline)
                                
                                Text(song.artist)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    .onAppear {
                        if getLangDirection() == .rightToLeft {
                            value.scrollTo(publicSongs.count - 1)
                        }
                    }
                }
            }
        }
        .onAppear {
            fetchPublicSongs()
        }
    }
    
    func fetchPublicSongs() {
        PublicSongsAction().call(
            completion: { response in
                self.publicSongs = response.data

            },
            failure: { error in
                print("Failed to fetch public songs: \(error)")
            }
        )
    }
    
    func getLangDirection() -> Locale.LanguageDirection? {
        guard let language = Locale.current.languageCode else { return nil }
        let direction = Locale.characterDirection(forLanguage: language)
        return direction
    }
}

struct HorizontalSongView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalSongView()
    }
}
